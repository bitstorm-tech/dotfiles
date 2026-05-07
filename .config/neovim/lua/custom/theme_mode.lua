local M = {}

-- Standard: immer Dark-Theme verwenden.
-- Auf `true` setzen, wenn NeoVim wieder dem macOS Hell/Dunkel-Modus folgen soll.
local default_follow_system_theme = false

-- Ursprüngliche System-Dark/Light-Mode-Erkennung (macOS) bewusst beibehalten,
-- damit sich das Verhalten bei Bedarf leicht wiederherstellen lässt.
local function is_dark_mode()
  local handle = io.popen 'defaults read -g AppleInterfaceStyle 2>/dev/null'
  if handle then
    local result = handle:read '*a'
    handle:close()
    return result:match 'Dark' ~= nil
  end
  return true -- Fallback: dark
end

local function apply_material_theme(use_dark_mode)
  vim.o.background = use_dark_mode and 'dark' or 'light'
  vim.g.material_style = use_dark_mode and 'darker' or 'lighter'
  vim.cmd.colorscheme 'material'
end

local function recreate_user_command(name, command, opts)
  pcall(vim.api.nvim_del_user_command, name)
  vim.api.nvim_create_user_command(name, command, opts)
end

function M.apply()
  local use_dark_mode = true

  if vim.g.theme_follow_system then
    use_dark_mode = is_dark_mode()
  end

  apply_material_theme(use_dark_mode)
end

function M.enable_system_sync()
  vim.g.theme_follow_system = true
  M.apply()
  vim.notify('Theme-Sync mit dem System aktiviert', vim.log.levels.INFO)
end

function M.disable_system_sync()
  vim.g.theme_follow_system = false
  M.apply()
  vim.notify('Theme-Sync mit dem System deaktiviert (Dark-Theme erzwungen)', vim.log.levels.INFO)
end

function M.toggle_system_sync()
  if vim.g.theme_follow_system then
    M.disable_system_sync()
  else
    M.enable_system_sync()
  end
end

function M.setup()
  if vim.g.theme_follow_system == nil then
    vim.g.theme_follow_system = default_follow_system_theme
  end

  local group = vim.api.nvim_create_augroup('custom-theme-mode', { clear = true })
  vim.api.nvim_create_autocmd({ 'FocusGained', 'VimResume' }, {
    group = group,
    desc = 'Refresh theme when returning to Neovim',
    callback = function()
      if vim.g.theme_follow_system then
        M.apply()
      end
    end,
  })

  recreate_user_command('ThemeSystemSyncEnable', M.enable_system_sync, {
    desc = 'Enable following macOS light/dark mode',
  })
  recreate_user_command('ThemeSystemSyncDisable', M.disable_system_sync, {
    desc = 'Disable following macOS light/dark mode and force dark theme',
  })
  recreate_user_command('ThemeSystemSyncToggle', M.toggle_system_sync, {
    desc = 'Toggle following macOS light/dark mode',
  })

  M.apply()
end

return M

local function close_all_buffers()
  local buf_numbers = vim.api.nvim_list_bufs()

  for _, buf_nr in ipairs(buf_numbers) do
    local is_nvim_tree = vim.bo[buf_nr].filetype == 'NvimTree'
    if not is_nvim_tree then
      vim.api.nvim_buf_delete(buf_nr, { force = true })
    end
  end

  -- NvimTree fokussieren falls sichtbar, sonst leerer Buffer als Fallback
  local view = require('nvim-tree.view')
  if view.is_visible() then
    require('nvim-tree.api').tree.focus()
    -- Leere "[No Name]" Buffer entfernen, die Neovim automatisch erstellt hat
    for _, buf_nr in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_valid(buf_nr)
        and vim.api.nvim_buf_get_name(buf_nr) == ''
        and vim.bo[buf_nr].filetype ~= 'NvimTree'
        and not vim.bo[buf_nr].modified
      then
        vim.api.nvim_buf_delete(buf_nr, { force = true })
      end
    end
  else
    vim.cmd('enew')
  end
end

vim.api.nvim_create_user_command('CloseAllBuffers', close_all_buffers, { desc = 'Close all buffers and focus NvimTree' })

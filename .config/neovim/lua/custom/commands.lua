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
  else
    vim.cmd('enew')
  end
end

vim.api.nvim_create_user_command('CloseAllBuffers', close_all_buffers, { desc = 'Close all buffers and focus NvimTree' })

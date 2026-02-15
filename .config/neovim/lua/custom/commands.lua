local function close_all_buffers_except_last_one()
  local buf_numbers = vim.api.nvim_list_bufs()
  local current_buf = vim.api.nvim_get_current_buf()

  for _, buf_nr in ipairs(buf_numbers) do
    local is_nvim_tree = vim.bo[buf_nr].filetype == 'NvimTree'
    if buf_nr ~= current_buf and not is_nvim_tree then
      vim.api.nvim_buf_delete(buf_nr, { force = true })
    end
  end
end

vim.api.nvim_create_user_command('CloseAllBuffers', close_all_buffers_except_last_one, { desc = 'Close all buffers except current and NvimTree' })

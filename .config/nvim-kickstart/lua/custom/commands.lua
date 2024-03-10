local function close_all_buffers_except_last_one()
  local buf_numbers = vim.api.nvim_list_bufs()

  for _, buf_nr in ipairs(buf_numbers) do
    if buf_nr ~= vim.api.nvim_get_current_buf() then
      vim.api.nvim_buf_delete(buf_nr, { force = true })
    end
  end
end

vim.api.nvim_create_user_command('CloseAllBuffers', close_all_buffers_except_last_one, { desc = 'Close all buffers except the last one' })

return {
  'mfussenegger/nvim-lint',
  ft = { 'gdscript', 'gdscript3' },
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = vim.tbl_deep_extend('force', lint.linters_by_ft or {}, {
      gdscript = { 'gdlint' },
      gdscript3 = { 'gdlint' },
    })

    local group = vim.api.nvim_create_augroup('gdscript-lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave' }, {
      group = group,
      callback = function(args)
        local filetype = vim.bo[args.buf].filetype
        if not vim.tbl_contains({ 'gdscript', 'gdscript3' }, filetype) then
          return
        end

        lint.try_lint()
      end,
    })
  end,
}

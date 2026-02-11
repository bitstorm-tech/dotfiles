return {
  'sudormrfbin/cheatsheet.nvim',
  cmd = { 'Cheatsheet', 'CheatsheetEdit' },
  keys = {
    { '<leader>?', '<cmd>Cheatsheet<cr>', desc = 'Cheatsheet' },
  },
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
  },
  opts = {},
}

return {
  'nvim-tree/nvim-tree.lua',
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    view = {
      adaptive_size = true,
    },
    git = {
      ignore = false,
      enable = false,
    },
  },
}

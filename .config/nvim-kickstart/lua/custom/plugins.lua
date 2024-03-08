return {
  {
    'folke/noice.nvim',
    lazy = false,
    event = 'VeryLazy',
    opts = {},
    config = function()
      require('noice').setup {}
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },
  {
    'rmagatti/auto-session',
    lazy = false,
    opts = {},
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = false,
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
}

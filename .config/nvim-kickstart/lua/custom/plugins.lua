return {
  {
    'folke/noice.nvim',
    lazy = false,
    event = 'VeryLazy',
    opts = {},
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
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
  {
    'mattn/emmet-vim',
  },
  {
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
  },
  {
    'okuuva/auto-save.nvim',
    cmd = 'ASToggle', -- optional for lazy loading on command
    event = { 'InsertLeave' }, -- optional for lazy loading on trigger events
    opts = {
      debounce_delay = 100,
      execution_message = {
        enabled = false,
      },
    },
  },
  {
    'windwp/nvim-autopairs',
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
}

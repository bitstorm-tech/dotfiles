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
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
  },
  {
    'rmagatti/auto-session',
    lazy = false,
    config = function()
      require('auto-session').setup()
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = false,
  },
}

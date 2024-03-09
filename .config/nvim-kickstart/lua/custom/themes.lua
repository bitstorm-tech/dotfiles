return {
  {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'dark' -- or 'light'
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
  },
}

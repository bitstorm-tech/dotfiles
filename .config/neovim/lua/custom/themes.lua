return {
  {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
      local tokyonight = require 'tokyonight'
      tokyonight.setup {
        style = 'storm',
        transparent = true,
        styles = {
          sidebars = 'transparent',
          floats = 'transparent',
        },
      }
      tokyonight.load()
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
  {
    'Mofiqul/dracula.nvim',
  },
  {
    'navarasu/onedark.nvim',
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        theme = 'dragon',
      })
    end,
  },
  {
    'catppuccin/nvim',
    priority = 1000,
  },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('gruvbox').setup({
        contrast = 'hard',
      })
      vim.o.background = 'dark'
    end,
  },
}

return {
  'nvim-tree/nvim-tree.lua',
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function(_, opts)
    require('nvim-tree').setup(opts)
  end,
  opts = {
    view = {
      adaptive_size = true,
      float = {
        enable = true,
        quit_on_focus_loss = true,
        open_win_config = function()
          return {
            relative = 'editor',
            border = 'rounded',
            width = 40,
            height = vim.o.lines - vim.o.cmdheight - 2,
            row = 0,
            col = 0,
          }
        end,
      },
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    git = {
      ignore = false,
      enable = true,
    },
    renderer = {
      highlight_git = 'icon',
      icons = {
        show = {
          folder_arrow = false,
          git = false,
        },
      },
    },
  },
}

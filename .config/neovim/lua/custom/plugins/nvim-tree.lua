return {
  'nvim-tree/nvim-tree.lua',
  lazy = false, -- Load immediately for auto-open
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function(_, opts)
    require('nvim-tree').setup(opts)

    -- Auto-open nvim-tree on startup
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        require('nvim-tree.api').tree.open()
      end,
    })
  end,
  opts = {
    view = {
      adaptive_size = true,
      side = 'left',
    },
    actions = {
      open_file = {
        quit_on_open = false,
      },
    },
    git = {
      ignore = false,
      enable = true,
    },
    renderer = {
      icons = {
        show = {
          folder_arrow = false,
          git = true,
        },
        glyphs = {
          git = {
            unstaged = '~',
            staged = '',
            unmerged = '',
            renamed = '',
            untracked = '★',
            deleted = '',
            ignored = '',
          },
        },
      },
    },
  },
}

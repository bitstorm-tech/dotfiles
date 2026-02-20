return {
  'nvim-tree/nvim-tree.lua',
  lazy = false, -- Load immediately for auto-open
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function(_, opts)
    require('nvim-tree').setup(opts)

    vim.api.nvim_create_autocmd('BufEnter', {
      callback = function()
        if vim.bo.filetype == 'NvimTree' then
          return
        end

        local api = require('nvim-tree.api')

        if not api.tree.is_visible() then
          return
        end

        api.tree.collapse_all()
        api.tree.find_file({ open = true, focus = false })
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
    update_focused_file = {
      enable = true,
      update_root = true,
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

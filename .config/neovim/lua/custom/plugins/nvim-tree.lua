return {
  'nvim-tree/nvim-tree.lua',
  lazy = true,
  cmd = { 'NvimTreeToggle', 'NvimTreeFindFileToggle', 'NvimTreeOpen' },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function(_, opts)
    require('nvim-tree').setup(opts)

    -- Float-Highlights an Normal anpassen (funktioniert mit allen Themes)
    vim.api.nvim_set_hl(0, 'NvimTreeNormalFloat', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { link = 'WinSeparator' })
  end,
  opts = {
    view = {
      adaptive_size = true,
      float = {
        enable = true,
        open_win_config = function()
          local screen_w = vim.opt.columns:get()
          local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
          local window_w = screen_w * 0.4
          local window_h = screen_h * 0.8
          local window_w_int = math.floor(window_w)
          local window_h_int = math.floor(window_h)
          local center_x = (screen_w - window_w) / 2
          local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
          return {
            border = 'rounded',
            relative = 'editor',
            row = center_y,
            col = center_x,
            width = window_w_int,
            height = window_h_int,
          }
        end,
      },
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    git = {
      ignore = false,
      enable = false,
    },
    renderer = {
      icons = {
        show = {
          folder_arrow = false,
        },
      },
    },
  },
}

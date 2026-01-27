return {
  'akinsho/bufferline.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      --     separator_style = 'thick',
      --     offsets = {
      --       {
      --         filetype = 'NvimTree',
      --         text = 'File Explorer',
      --         text_align = 'left',
      --         separator = true,
      --       },
      --     },
    },
  },
}

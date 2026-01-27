return {
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    keys = {
      {
        mode = { 'n' },
        '<Leader>m',
        '<Plug>(VM-Find-Under)',
        desc = 'Create a selection for word under the cursor',
      },
      {
        mode = { 'v' },
        '<Leader>m',
        '<Plug>(VM-Find-Subword-Under)',
        desc = 'Create a selection for selected text',
      },
    },
    config = function()
      vim.g.VM_maps = {
        ['Find Under'] = '<Leader>m',
        ['Find Subword Under'] = '<Leader>m',
      }
    end,
  },
}

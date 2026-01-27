-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>Q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('v', 'p', '"_dP')

-- Change without yanking (use black hole register)
vim.keymap.set({ 'n', 'v' }, 'c', '"_c')
vim.keymap.set({ 'n', 'v' }, 'C', '"_C')
vim.keymap.set('n', 'cc', '"_cc')
vim.keymap.set('n', 'cw', '"_cw')
vim.keymap.set('n', 'ce', '"_ce')
vim.keymap.set('n', 'cb', '"_cb')
vim.keymap.set('n', 'ciw', '"_ciw')
vim.keymap.set('n', 'caw', '"_caw')
vim.keymap.set('n', 'ci"', '"_ci"')
vim.keymap.set('n', "ci'", "\"_ci'")
vim.keymap.set('n', 'ci`', '"_ci`')
vim.keymap.set('n', 'cib', '"_cib')
vim.keymap.set('n', 'ci(', '"_ci(')
vim.keymap.set('n', 'ci)', '"_ci)')
vim.keymap.set('n', 'ci[', '"_ci[')
vim.keymap.set('n', 'ci]', '"_ci]')
vim.keymap.set('n', 'ci{', '"_ci{')
vim.keymap.set('n', 'ci}', '"_ci}')
vim.keymap.set('n', 'cit', '"_cit')
vim.keymap.set('n', 'ci<', '"_ci<')
vim.keymap.set('n', 'ci>', '"_ci>')

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<D-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<D-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<D-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<D-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>o', 'o<Esc>', { desc = 'New line below' })
vim.keymap.set('n', '<leader>O', 'O<Esc>', { desc = 'New line below' })
vim.keymap.set('n', '<leader>lg', ':LazyGit<cr>', { desc = 'Open LazyGit' })
vim.keymap.set('n', '<leader>lu', ':Lazy update<cr>', { desc = 'Lazy update' })
vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<cr>', { desc = 'Toggle NvimTree [e]xplorer' })
vim.keymap.set('n', '<C-c>', ':bw<cr> :bprevious<cr>', { desc = 'Close current buffer' })
vim.keymap.set('n', '<leader>T', ':Telescope colorscheme<cr>', { desc = 'Open colorscheme' })
vim.keymap.set('n', '<leader>q', ':qa<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>ww', ':wa<cr>', { desc = 'Save all' })
vim.keymap.set('n', '<leader>ba', ':CloseAllBuffers<cr>', { desc = 'Close all buffers' })
vim.keymap.set('n', '<C-s>', ':wa<cr>', { desc = 'Save all' })
vim.keymap.set('n', '<D-s>', ':wa<cr>', { desc = 'Save all' })
vim.keymap.set('n', 's', ':wa<cr>', { desc = 'Save all' })
vim.keymap.set('n', '<leader>bn', ':bNext<cr>', { desc = 'Goto next buffer' })
vim.keymap.set('n', '<C-l>', ':bnext<cr>', { desc = 'Goto next buffer' })
vim.keymap.set('n', '<C-h>', ':bprevious<cr>', { desc = 'Goto next buffer' })
vim.keymap.set('n', '<leader>gb', ':BlameToggle<cr>', { desc = 'Toggle Git blame' })
vim.keymap.set('n', '<leader>t', ':ToggleTerm<cr>', { desc = 'Open terminal' })

vim.keymap.set('i', '<C-e>', '<C-o>$', { desc = 'Jump to the end of the line when in insert mode' })
vim.keymap.set('i', '<C-o>', '<Esc>o', { desc = 'New line below' })
vim.keymap.set('i', '<C-s>', '<Esc>:wa<cr>', { desc = 'Save all' })
vim.keymap.set('i', '<D-s>', '<Esc>:wa<cr>', { desc = 'Save all' })
vim.keymap.set('i', '<Esc>', '<Esc>:wa<cr>', { desc = 'Save all' })

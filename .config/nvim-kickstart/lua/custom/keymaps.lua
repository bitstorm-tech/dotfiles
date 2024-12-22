-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('v', 'p', '"_dP')

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>o', 'o<Esc>', { desc = 'New line below' })
vim.keymap.set('n', '<leader>O', 'O<Esc>', { desc = 'New line below' })
vim.keymap.set('n', '<leader>lg', ':LazyGit<cr>', { desc = 'Open LazyGit' })
vim.keymap.set('n', '<leader>lu', ':Lazy update<cr>', { desc = 'Lazy update' })
vim.keymap.set('n', '<leader>E', ':NvimTreeFindFileToggle<cr>', { desc = 'Toggle NvimTree' })
vim.keymap.set('n', '<leader>x', ':bw<cr> :bnext<cr>', { desc = 'Close current buffer' })
vim.keymap.set('n', '<leader>th', ':Telescope colorscheme<cr>', { desc = 'Open colorscheme' })
vim.keymap.set('n', '<leader>Q', ':qa<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>ww', ':wa<cr>', { desc = 'Save all' })
vim.keymap.set('n', '<leader>ba', ':CloseAllBuffers<cr>', { desc = 'Close all buffers' })
vim.keymap.set('n', '<C-s>', ':wa<cr>', { desc = 'Save all' })
vim.keymap.set('n', 's', ':wa<cr>', { desc = 'Save all' })
vim.keymap.set('n', '<leader>bn', ':bNext<cr>', { desc = 'Goto next buffer' })
-- vim.keymap.set('n', '<S-l>', ':bnext<cr>', { desc = 'Goto next buffer' })
-- vim.keymap.set('n', '<S-h>', ':bprevious<cr>', { desc = 'Goto next buffer' })
vim.keymap.set('n', '<leader>gb', ':BlameToggle<cr>', { desc = 'Toggle Git blame' })

vim.keymap.set('i', 'hh', '<C-o>$', { desc = 'Jump to the end of the line when in insert mode' })
vim.keymap.set('i', '<C-o>', '<Esc>o', { desc = 'New line below' })
vim.keymap.set('i', '<C-s>', '<Esc>:wa<cr>', { desc = 'Save all' })
vim.keymap.set('i', 'jj', '<Esc>:wa<cr>', { desc = 'Exit Insert mode and save all' })
-- vim.keymap.set('i', 'kk', '<Esc><Esc>', { desc = 'Exit Insert mode' })

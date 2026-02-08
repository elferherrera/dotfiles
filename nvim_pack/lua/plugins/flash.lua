require('flash').setup()

vim.keymap.set({ 'n', 'x', 'o' }, 's', require('flash').jump, { desc = 'Flash' })
vim.keymap.set({ 'n', 'x', 'o' }, 'S', require('flash').treesitter, { desc = 'Flash treesitter' })
vim.keymap.set({ 'o' }, 'r', require('flash').remote, { desc = 'Remote flash' })
vim.keymap.set({ 'x', 'o' }, 'R', require('flash').treesitter_search, { desc = 'Treesitter search' })
vim.keymap.set({ 'c' }, '<c-s>', require('flash').toggle, { desc = 'Toggle flash search' })

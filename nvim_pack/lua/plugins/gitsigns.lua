require('gitsigns').setup()

vim.keymap.set('n', '<leader>gk', ':Gitsigns preview_hunk<CR>', { noremap = true, silent = true, desc = 'Gitsigns preview hunk' })
vim.keymap.set('n', '<leader>gu', ':Gitsigns reset_hunk<CR>', { noremap = true, silent = true, desc = 'Gitsigns reset hunk' })
vim.keymap.set('n', '<leader>gd', ':vert Gitsigns diffthis<CR>', { noremap = true, silent = true, desc = 'Gitsigns diffthis' })

vim.keymap.set('n', '<leader>gS', '<Cmd>Gitsigns stage_hunk<CR>', { noremap = true, silent = true, desc = 'Gitsigns stage hunk' })
vim.keymap.set('n', '<leader>gR', '<Cmd>Gitsigns stage_buffer<CR>', { noremap = true, silent = true, desc = 'Gitsigns stage buffer' })
vim.keymap.set('n', '<leader>gL', '<Cmd>Gitsigns blame_line<CR>', { noremap = true, silent = true, desc = 'Gitsigns blame line' })
vim.keymap.set('n', '<leader>gB', '<Cmd>Gitsigns blame<CR>', { noremap = true, silent = true, desc = 'Gitsigns blame' })

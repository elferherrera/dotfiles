-- alias function to remap keys
local keymap = vim.keymap.set

-- we remap space to leader key so ensure it does nothing
keymap('', '<Space>', '<Nop>', options)

local normal_mode_keymaps = {
  ['x'] = { action = '"_x', desc = 'Delete character without copying' },

  ['<leader>q'] = { action = '<Cmd>quit<CR>', desc = 'Easier quit' },
  ['<leader>w'] = { action = '<Cmd>w<CR>', desc = 'Easier save' },

  ['<S-l>'] = { action = '<Cmd>bnext<CR>', desc = 'Switch to the next buffer' },
  ['<S-h>'] = { action = '<Cmd>bprevious<CR>', desc = 'Switch to the previous buffer' },

  ['[d'] = { action = '<Cmd>lua vim.diagnostic.goto_prev()<CR>', desc = 'Go to the previous diagnostic' },
  [']d'] = { action = '<Cmd>lua vim.diagnostic.goto_next()<CR>', desc = 'Go to the next diagnostic' },

  ['<leader>v'] = { action = '<Cmd>sp<CR>', desc = 'Horizontal split' },
  ['<leader>h'] = { action = '<Cmd>vs<CR>', desc = 'Vertical split' },

  ['<Up>'] = { action = '<Cmd>resize +5<CR>', desc = 'Increase window height' },
  ['<Down>'] = { action = '<Cmd>resize -5<CR>', desc = 'Decrease window height' },
  ['<Left>'] = { action = '<Cmd>vertical resize -5<CR>', desc = 'Decrease window width' },
  ['<Right>'] = { action = '<Cmd>vertical resize +5<CR>', desc = 'Increase window width' },

  ['<leader>nl'] = { action = '<Cmd>terminal<CR>', desc = 'Open a terminal in the current buffer' },
  ['<leader>nk'] = { action = '<Cmd>botright new | resize 10 | terminal<CR>', desc = 'Open a terminal in VS Code style' },

  ['<leader>za'] = { action = 'za', desc = 'Fold the scope under cursor' },
  ['<leader>zr'] = { action = 'zR', desc = 'Expand all folds in the current buffer' },

  ['<leader>tl'] = { action = '<cmd> tabs<CR>', desc = 'List tabs' },
  ['<leader>td'] = { action = '<cmd> tabclose<CR>', desc = 'Close tab' },
  ['<leader>tt'] = { action = '<cmd> tab new<CR>', desc = 'New tab' },
  ['<leader>tn'] = { action = '<cmd> tabn<CR>', desc = 'Next tab' },
  ['<leader>tp'] = { action = '<cmd> tabp<CR>', desc = 'Previous tab' },

  ['<C-k>'] = { action = '<C-w><C-k>', desc = 'Move focus to the upper window' },
  ['<C-j>'] = { action = '<C-w><C-j>', desc = 'Move focus to the lower window' },
  ['<C-l>'] = { action = '<C-w><C-l>', desc = 'Move focus to the right window' },
  ['<C-h>'] = { action = '<C-w><C-h>', desc = 'Move focus to the left window' },

  ['<Esc>'] = { action = '<cmd> nohlsearch<CR>', desc = 'Esc to clear selection' },

  ['<leader>lq'] = { action = '<Cmd> copen<CR>', desc = 'Open quickfix' },
  ['<leader>ll'] = { action = '<Cmd> lopen<CR>', desc = 'Open location list' },
  ['[q'] = { action = '<Cmd> cprev<CR>', desc = 'Previus quickfix' },
  [']q'] = { action = '<Cmd> cnext<CR>', desc = 'Next quickfix' },

  ['[b'] = { action = '<Cmd> bprev<CR>', desc = 'Previus buffer' },
  [']b'] = { action = '<Cmd> bnext<CR>', desc = 'Next buffer' },

  ['<leader>x'] = { action = '<Cmd> luafile %<CR>', desc = 'Execute current lua file' },
}

for keys, map in pairs(normal_mode_keymaps) do
  keymap('n', keys, map.action, { noremap = true, silent = true, desc = map.desc })
end

-- custom keymaps in visual mode
local visual_mode_keymaps = {
  ['<'] = { action = '<gv', desc = 'Reduce indentation but stay in visual mode' },
  ['>'] = { action = '>gv', desc = 'Increase indentation but stay in visual mode' },
}

for keys, map in pairs(visual_mode_keymaps) do
  keymap('v', keys, map.action, { noremap = true, silent = true, desc = map.desc })
end

-- custom keymaps in visual block mode
local visual_block_mode_keymaps = {
  ['J'] = { action = ":move '>+1<CR>gv-gv", desc = 'Move highlighted text down' },
  ['K'] = { action = ":move '<-2<CR>gv-gv", desc = 'Move highlighted text up' },

  ['<leader>s'] = {
    action = "<Cmd>lua vim.api.nvim_feedkeys(':ExactReplace ', 'c', false)<CR>",
    desc = 'Search and replace exact words in highlighted text',
  },

  ['<leader>a'] = {
    action = ':s/$/',
    desc = 'Create multiple cursors and add text to the end of multiple lines',
  },

  ['<leader>i'] = {
    action = ':s/^/',
    desc = 'Create multiple cursors and add text to the beginning of multiple lines',
  },

  ['<leader>p'] = {
    action = "<Cmd>lua vim.api.nvim_feedkeys(':AppendTo ', 'c', false)<CR>",
    desc = 'Search and add text following the search results',
  },
}

for keys, map in pairs(visual_block_mode_keymaps) do
  keymap('x', keys, map.action, { noremap = true, silent = true, desc = map.desc })
end

-- terminal functionalities
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- keymap('t', 'qq', '<C-\\><C-n>', { noremap = true, silent = true, desc = 'Exit insert mode in terminal' })

-- to prevent highlighting search results
keymap('c', '<C-y>', '/g | nohlsearch<CR>', { noremap = true, silent = true, desc = 'Enter and remove highlight from search results' })

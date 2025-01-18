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

  ['<leader>yl'] = { action = '<Cmd>vertical resize -10<CR>', desc = 'Reduce current window vertical size' },
  ['<leader>yh'] = { action = '<Cmd>vertical resize +10<CR>', desc = 'Increase current window vertical size' },
  ['<leader>yk'] = { action = '<Cmd>horizontal resize -10<CR>', desc = 'Reduce current window horizontal size' },
  ['<leader>yj'] = { action = '<Cmd>horizontal resize +10<CR>', desc = 'Increase current window horizontal size' },

  ['<leader>ul'] = { action = '<Cmd>terminal<CR>', desc = 'Open a terminal in the current buffer' },
  ['<leader>uk'] = { action = '<Cmd>botright new | resize 10 | terminal<CR>', desc = 'Open a terminal in VS Code style' },

  ['<leader>a'] = { action = 'za', desc = 'Fold the scope under cursor' },
  ['<leader>r'] = { action = 'zR', desc = 'Expand all folds in the current buffer' },

  ['<leader>tt'] = { action = '<cmd> tab new<CR>', desc = 'New tab' },
  ['<leader>tn'] = { action = '<cmd> tabn<CR>', desc = 'Next tab' },
  ['<leader>tp'] = { action = '<cmd> tabp<CR>', desc = 'Previous tab' },
  -- ['<leader>tl'] = { action = '<cmd> tabs<CR>', desc = 'List tabs' },
  -- ['<leader>tl'] = { action = '<cmd> Telescope telescope-tabs list_tabs<CR>', desc = 'List tabs in telescope' },

  ['<C-k>'] = { action = '<C-w><C-k>', desc = 'Move focus to the upper window' },
  ['<C-j>'] = { action = '<C-w><C-j>', desc = 'Move focus to the lower window' },
  ['<C-l>'] = { action = '<C-w><C-l>', desc = 'Move focus to the right window' },
  ['<C-h>'] = { action = '<C-w><C-h>', desc = 'Move focus to the left window' },

  ['<Esc>'] = { action = '<cmd> nohlsearch<CR>', desc = 'Esc to clear selection' },

  ['<leader>ee'] = { action = '<Cmd> copen<CR>', desc = 'Open next quickfix' },
  ['<leader>er'] = { action = '<Cmd> cclose<CR>', desc = 'Close next quickfix' },
  ['<leader>ej'] = { action = '<Cmd> cnext<CR>', desc = 'Move to next quickfix file' },
  ['<leader>ek'] = { action = '<Cmd> cprevious<CR>', desc = 'Move to prev quickfix file' },

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

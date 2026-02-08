-- alias function to remap keys
local keymap = vim.keymap.set

-- we remap space to leader key so ensure it does nothing
keymap('', '<Space>', '<Nop>')

local normal_mode_keymaps = {
  ['x'] = { action = '"_x', desc = 'Delete character without copying' },

  ['<leader>q'] = { action = ':quit<CR>', desc = 'Easier quit' },
  ['<leader>w'] = { action = ':w<CR>', desc = 'Easier save' },

  ['<S-l>'] = { action = ':bnext<CR>', desc = 'Switch to the next buffer' },
  ['<S-h>'] = { action = ':bprevious<CR>', desc = 'Switch to the previous buffer' },

  ['[d'] = { action = ':lua vim.diagnostic.goto_prev()<CR>', desc = 'Go to the previous diagnostic' },
  [']d'] = { action = ':lua vim.diagnostic.goto_next()<CR>', desc = 'Go to the next diagnostic' },

  ['<leader>v'] = { action = ':sp<CR>', desc = 'Horizontal split' },
  ['<leader>h'] = { action = ':vs<CR>', desc = 'Vertical split' },

  ['<Up>'] = { action = ':resize +5<CR>', desc = 'Increase window height' },
  ['<Down>'] = { action = ':resize -5<CR>', desc = 'Decrease window height' },
  ['<Left>'] = { action = ':vertical resize -5<CR>', desc = 'Decrease window width' },
  ['<Right>'] = { action = ':vertical resize +5<CR>', desc = 'Increase window width' },

  ['<leader>nl'] = { action = ':terminal<CR>', desc = 'Open a terminal in the current buffer' },
  ['<leader>nk'] = { action = ':botright new | resize 10 | terminal<CR>', desc = 'Open a terminal in VS Code style' },

  ['<leader>za'] = { action = 'za', desc = 'Fold the scope under cursor' },
  ['<leader>zr'] = { action = 'zR', desc = 'Expand all folds in the current buffer' },

  ['<leader>tl'] = { action = ':tabs<CR>', desc = 'List tabs' },
  ['<leader>td'] = { action = ':tabclose<CR>', desc = 'Close tab' },
  ['<leader>tt'] = { action = ':tab new<CR>', desc = 'New tab' },
  ['<leader>tn'] = { action = ':tabn<CR>', desc = 'Next tab' },
  ['<leader>tp'] = { action = ':tabp<CR>', desc = 'Previous tab' },

  ['<C-k>'] = { action = '<C-w><C-k>', desc = 'Move focus to the upper window' },
  ['<C-j>'] = { action = '<C-w><C-j>', desc = 'Move focus to the lower window' },
  ['<C-l>'] = { action = '<C-w><C-l>', desc = 'Move focus to the right window' },
  ['<C-h>'] = { action = '<C-w><C-h>', desc = 'Move focus to the left window' },

  ['<Esc>'] = { action = ':nohlsearch<CR>', desc = 'Esc to clear selection' },

  ['<leader>lq'] = { action = ':copen<CR>', desc = 'Open quickfix' },
  ['<leader>ll'] = { action = ':lopen<CR>', desc = 'Open location list' },
  ['[q'] = { action = ':cprev<CR>', desc = 'Previus quickfix' },
  [']q'] = { action = ':cnext<CR>', desc = 'Next quickfix' },

  ['[b'] = { action = ':bprev<CR>', desc = 'Previus buffer' },
  [']b'] = { action = ':bnext<CR>', desc = 'Next buffer' },

  ['<leader>x'] = { action = ':luafile %<CR>', desc = 'Execute current lua file' },
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

  ['<leader>a'] = {
    action = ':s/$/',
    desc = 'Create multiple cursors and add text to the end of multiple lines',
  },

  ['<leader>i'] = {
    action = ':s/^/',
    desc = 'Create multiple cursors and add text to the beginning of multiple lines',
  },

  -- ['<leader>p'] = {
  --   action = ":lua vim.api.nvim_feedkeys(':AppendTo ', 'c', false)<CR>",
  --   desc = 'Search and add text following the search results',
  -- },
  --
  -- ['<leader>s'] = {
  --   action = ":lua vim.api.nvim_feedkeys(':ExactReplace ', 'c', false)<CR>",
  --   desc = 'Search and replace exact words in highlighted text',
  -- },

}

for keys, map in pairs(visual_block_mode_keymaps) do
  keymap('x', keys, map.action, { noremap = true, silent = true, desc = map.desc })
end

-- to prevent highlighting search results
keymap('c', '<C-y>', '/g | nohlsearch<CR>', { noremap = true, silent = true, desc = 'Enter and remove highlight from search results' })

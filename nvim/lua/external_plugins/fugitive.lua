return {
  'tpope/vim-fugitive',
  lazy = false,
  config = function()
    vim.keymap.set('n', '<leader>gb', '<cmd> G blame<CR>', { noremap = true, silent = true, desc = '[G]it [B]lame' })
    vim.keymap.set('n', '<leader>gf', '<cmd> Git<CR>', { noremap = true, silent = true, desc = '[G]it [f]fugitive git status' })
  end,
}

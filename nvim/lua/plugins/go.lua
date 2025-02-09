return {
  'ray-x/go.nvim',
  lazy = true,
  ft = { 'go', 'gomod' },
  dependencies = {
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('go').setup()
  end,
  event = { 'CmdlineEnter' },
  build = ':lua require("go.install").update_all_sync()',
}

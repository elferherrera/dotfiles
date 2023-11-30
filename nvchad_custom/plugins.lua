local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "ruff",
        "rust-analyzer",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    ft = {"python", "rust"},
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = {"rust"},
    --config = function()
    --  vim.opt.shell = '/bin/bash'
    --end
  },
  {
    "nvimtools/none-ls.nvim",
    ft = {"python"},
    opts = function ()
      return require "custom.configs.none-ls"
    end
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    'ggandor/leap.nvim',
    lazy = false,
    config = function ()
      require("leap").add_default_mappings()
    end
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  }
}

return plugins

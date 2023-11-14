local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "ruff",
        "pyright",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
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
    config = function ()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end
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
    config = function ()
      require "custom.configs.trouble"
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  }
}

return plugins

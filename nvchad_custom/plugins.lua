local plugins = {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function()
			return require("custom.configs.treesitter")
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"black",
				"ruff",
				"rust-analyzer",
				"stylua",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		ft = { "python", "rust" },
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"rust-lang/rust.vim",
		ft = { "rust" },
		--config = function()
		--  vim.opt.shell = '/bin/bash'
		--end
	},
	{
		"nvimtools/none-ls.nvim",
		lazy = false,
		config = function()
			require("custom.configs.none-ls")
		end,
	},
	{
		"tpope/vim-fugitive",
		lazy = false,
	},
	{
		"ggandor/leap.nvim",
		lazy = false,
		config = function()
			require("leap").add_default_mappings()
		end,
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
	},
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("neoclip").setup()
		end,
	},
	{
		"echasnovski/mini.surround",
		lazy = false,
		opts = {
			mappings = {
				add = "gsa",
				delete = "gsd",
				find = "gsf",
				find_left = "gsF",
				highlight = "gsh",
				replace = "gsr",
				update_n_lines = "gsn",
			},
		},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		lazy = false,
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			require("telescope").load_extension("ui-select")
		end,
	},
}

return plugins

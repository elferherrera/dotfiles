local config = require("plugins.configs.lspconfig")
local util = require("lspconfig/util")
local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
	local utils = require("core.utils")
	utils.load_mappings("lspconfig", { buffer = bufnr })
end

local servers = {
	{
		name = "ruff_lsp",
		files = { "python" },
		root_dir = "",
		settings = {},
	},
	{
		name = "pyright",
		files = { "python" },
		root_dir = "",
		settings = {},
	},
	{
		name = "gopls",
		files = { "go", "gomod", "gowork", "gotmpl" },
		root_dir = { "go.work", "go.mod", ".git" },
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = true,
				analyses = {
					unusedparams = true,
				},
			},
		},
	},
	{
		name = "rust_analyzer",
		files = { "rust" },
		root_dir = { "Cargo.toml" },
		settings = {
			["rust-analyzer"] = {
				cargo = {
					features = (function()
						-- Rust Features should be declared in an env variable called 
            -- RUST_FEATURES in the project environment
						local rust_env = os.getenv("RUST_FEATURES")
						if rust_env == nil then
							rust_env = ""
						end

						return vim.split(rust_env, " ")
					end)(),
				},
			},
		},
	},
}

for _, server in ipairs(servers) do
	lspconfig[server.name].setup({
		on_attach = on_attach,
		capabilities = config.capabilities,
		filetypes = server.files,
		root_dir = util.root_pattern(server.root_dir),
		settings = server.settings,
	})
end

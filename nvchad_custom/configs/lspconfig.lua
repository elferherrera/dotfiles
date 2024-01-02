local config = require("plugins.configs.lspconfig")

local on_attach = function(client, bufnr)
	local utils = require("core.utils")
	utils.load_mappings("lspconfig", { buffer = bufnr })
end

local lspconfig = require("lspconfig")
lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = config.capabilities,
	filetypes = { "python" },
})

lspconfig.ruff_lsp.setup({
	on_attach = on_attach,
	capabilities = config.capabilities,
	filetypes = { "python" },
})

local function get_rust_features()
	local rust_env = os.getenv("RUST_FEATURES")

	if rust_env == nil then
		rust_env = ""
	end
	return vim.split(rust_env, " ")
end

local util = require("lspconfig/util")

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = config.capabilities,
	filetypes = { "rust" },
	root_dir = util.root_pattern("Cargo.toml"),
	settings = {
		["rust-analyzer"] = {
			cargo = {
				features = get_rust_features(),
			},
		},
	},
})

local config = require("plugins.configs.lspconfig")
local util = require("lspconfig/util")

local on_attach = function(client, bufnr)
	local utils = require("core.utils")
	utils.load_mappings("lspconfig", { buffer = bufnr })
end

local lspconfig = require("lspconfig")
local servers = {
	{ "ruff_lsp", "python" },
	{ "pyright", "python" },
	{ "gopls", "go" },
}

for _, vals in ipairs(servers) do
	local lsp, lang = vals[1], vals[2]
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = config.capabilities,
		filetypes = { lang },
	})
end

-- Rust Features are declared in an env variable called RUST_FEATURES
-- in the project environment
local function get_rust_features()
	local rust_env = os.getenv("RUST_FEATURES")
	if rust_env == nil then
		rust_env = ""
	end
	return vim.split(rust_env, " ")
end

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

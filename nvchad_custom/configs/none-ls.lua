local null_ls = require("null-ls")

local sources = {
	null_ls.builtins.formatting.stylua,
}

null_ls.setup({
	debug = true,
	sources = sources,
})

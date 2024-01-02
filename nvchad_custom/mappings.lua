local M = {}

M.fugitive = {
	n = {
		["<leader>gs"] = {
			vim.cmd.Git,
			"Fugitive git status",
		},
		["<leader>gr"] = {
			"<cmd> G difftool master <CR>",
			"Get all differences with master",
		},
		["<leader>gc"] = {
			"<cmd> Gvdiffsplit master <CR>",
			"Compare file with master",
		},
		["<leader>ga"] = {
			[[:G difftool ]],
			"Get all differences with a specific branch",
		},
		["<leader>gz"] = {
			[[:G Gvdiffsplit ]],
			"Compare file with specific branch",
		},
	},
}

M.trouble = {
	n = {
		["<leader>ox"] = {
			"<cmd> TroubleToggle <CR>",
			"Main trouble",
		},
		["<leader>ow"] = {
			"<cmd> Trouble workspace_diagnostics<CR>",
			"Workspace diagnostics",
		},
		["<leader>od"] = {
			"<cmd> Trouble document_diagnostics<CR>",
			"Document diagnostics",
		},
		["<leader>oq"] = {
			"<cmd> Trouble quickfix<CR>",
			"Quick fix",
		},
		["<leader>ol"] = {
			"<cmd> Trouble locList<CR>",
			"Loc list",
		},
		["gR"] = {
			"<cmd> Trouble lsp_references<CR>",
			"LSP references",
		},
	},
}

M.rust = {
	n = {
		["<leader>gf"] = {
			"<cmd> RustFmt <CR>",
			"Rust format file",
		},
		["<leader>gp"] = {
			"<cmd> RustRun <CR>",
			"Rust run code",
		},
	},
}

M.general = {
	n = {
		["<leader>s"] = {
			[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
			"Replace current word",
		},
	},
}

M.telescope = {
	n = {
		["<leader>fc"] = {
			"<cmd> Telescope neoclip<CR>",
			"Neovim clip",
		},
		["<leader>fv"] = {
			"<cmd> Telescope macroscope<CR>",
			"Neovim macros",
		},
	},
}

return M

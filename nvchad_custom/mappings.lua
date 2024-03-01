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
		["<C-s-l>"] = {
			"<cmd> vertical resize +10<CR>",
			"Resize vertical window +10",
		},
		["<C-s-h>"] = {
			"<cmd> vertical resize -10<CR>",
			"Resize vertical window -10",
		},
		["<C-s-j>"] = {
			"<cmd> resize +5<CR>",
			"Resize window +5",
		},
		["<C-s-k>"] = {
			"<cmd> resize -5<CR>",
			"Resize window -5",
		},
		["<C-s-b>"] = {
			"<cmd> tab new<CR>",
			"Creates a new tab",
		},
		["<C-s-n>"] = {
			"<cmd> tabp<CR>",
			"Next tab",
		},
		["<C-s-m>"] = {
			"<cmd> tabn<CR>",
			"Prev tab",
		},
	},
}

M.telescope = {
	n = {
		["<leader>fv"] = {
			"<cmd> Telescope macroscope<CR>",
			"Neovim macros",
		},
	},
}

M.oil = {
	n = {
		["<leader>-"] = {
			"<cmd> Oil<CR>",
			"Oil file manager",
		},
	},
}

return M

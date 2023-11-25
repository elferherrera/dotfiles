local M = {}

M.fugitive = {
  n = {
    ["<leader>gs"] = {
      vim.cmd.Git,
      "Fugitive git status"
    },
    ["<leader>gr"] = {
      "<cmd> G difftool master <CR>",
      "Get all differences with master"
    },
    ["<leader>gc"] = {
      "<cmd> Gvdiffsplit master <CR>",
      "Compare file with master"
    }
  }
}

M.trouble = {
  n = {
    ["<leader>ox"] = {
      "<cmd> TroubleToggle <CR>",
      "Main trouble"
    },
    ["<leader>ow"] = {
      "<cmd> Trouble workspace_diagnostics<CR>",
      "Workspace diagnostics"
    },
    ["<leader>od"] = {
      "<cmd> Trouble document_diagnostics<CR>",
      "Document diagnostics"
    },
    ["<leader>oq"] = {
      "<cmd> Trouble quickfix<CR>",
      "Quick fix"
    },
    ["<leader>ol"] = {
      "<cmd> Trouble locList<CR>",
      "Loc list"
    },
    ["gR"] = {
      "<cmd> Trouble lsp_references<CR>",
      "LSP references"
    }
  }
}

return M

require 'nvim-treesitter'.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

-- lua require('nvim-treesitter').install { 'bash' }
-- lua require('nvim-treesitter').install { 'diff' }
-- lua require('nvim-treesitter').install { 'html' }
-- lua require('nvim-treesitter').install { 'lua' }
-- lua require('nvim-treesitter').install { 'luadoc' }
-- lua require('nvim-treesitter').install { 'query' }
-- lua require('nvim-treesitter').install { 'vim' }
-- lua require('nvim-treesitter').install { 'vimdoc' }
-- lua require('nvim-treesitter').install { 'nu' }
-- lua require('nvim-treesitter').install { 'python' }
-- lua require('nvim-treesitter').install { 'go' }
-- lua require('nvim-treesitter').install { 'rust' }
-- lua require('nvim-treesitter').install { 'yaml' }

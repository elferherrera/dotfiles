vim.pack.add({
  { src = 'https://github.com/catppuccin/nvim' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/stevearc/oil.nvim' },
  { src = 'https://github.com/nvim-pick/mini.pick' },
  { src = 'https://github.com/folke/flash.nvim' },
  { src = 'https://github.com/folke/which-key.nvim' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  -- git information
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  -- git links
  { src = 'https://github.com/ruifm/gitlinker.nvim' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  -- completion
  { src = 'https://github.com/saghen/blink.cmp' },
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
  { src = 'https://github.com/L3MON4D3/LuaSnip' },
  -- quickfix
  { src = 'https://github.com/kevinhwang91/nvim-bqf' },
  { src = 'https://github.com/junegunn/fzf' },
})

-- run this to install the fzf pluin in nvim
-- call fzf#install

vim.cmd("colorscheme catppuccin")
vim.cmd(":hi statusline guibg=NONE")

local plugin_files = {
  'lsp',
  'mason',
  'mini_pick',
  'oil',
  'which-key',
  'flash',
  'treesitter',
  'gitlinker',
  'gitsigns',
  'blink_cmp',
  -- personal plugins
  'terminal',
}

local function load_config(filename)
  local success, _ = pcall(require, filename)
  if not success then
    vim.notify('Failed to load a configuration file: ' .. filename)
  end
end

local location = 'plugins.'
for _, plugin_file in pairs(plugin_files) do
  load_config(location .. plugin_file)
end

-- a function to load config files
local function load_config(filename)
  -- use protected call so if something fails it does not crash
  local success, _ = pcall(require, filename)

  -- in case of error, tell us which file is problematic
  if not success then
    vim.notify('Failed to load a configuration file: ' .. filename)
  end
end

-- list all available config files
local config_files = {
  'globals',
  'commands',
  'plugins',
  --
  -- 'scripts/cmd_line',
  -- 'scripts/lsp_info',
  -- 'scripts/floating_term',
  -- 'scripts/harpoon',
  --
  'options',
  'keymaps',
}

-- load all listed config files
for _, config_file in pairs(config_files) do
  load_config(config_file)
end

-- vim.diagnostic.config { virtual_text = true }
-- vim.lsp.enable { 'lua_ls' }
-- vim.lsp.enable { 'ty' }
-- vim.lsp.enable { 'ruff_lsp' }
-- vim.lsp.enable { 'ruff' }

-- vim.pack.add({
--   "https://github.com/folke/tokyonight.nvim"
-- })
-- vim.cmd[[colorscheme tokyonight]]

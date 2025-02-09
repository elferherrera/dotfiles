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
  'commands',
  'globals',
  'plugins',
  'keymaps',
  --
  -- 'scripts/cmd_line',
  -- 'scripts/lsp_info',
  'scripts/floating_term',
  --
  'options',
}

-- load all listed config files
for _, config_file in pairs(config_files) do
  load_config(config_file)
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

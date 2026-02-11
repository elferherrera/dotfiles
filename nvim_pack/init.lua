local function load_config(filename)
  local success, _ = pcall(require, filename)
  if not success then
    vim.notify('Failed to load a configuration file: ' .. filename)
  end
end

local config_files = {
  'globals',
  'commands',
  'plugins',
  'options',
  'keymaps',
}

for _, config_file in pairs(config_files) do
  load_config(config_file)
end

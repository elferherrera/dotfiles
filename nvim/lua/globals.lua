-- list of all global variables
local variables = {
  -- this configuration does not use perl
  loaded_perl_provider = 0,
  -- space is a global leader key
  mapleader = ' ',
  -- space is a local leader key as well
  maplocalleader = ' ',
  -- Set to true if you have a Nerd Font installed and selected in the terminal
  have_nerd_font = true,
}

-- set all global variables
for variable, value in pairs(variables) do
  vim.g[variable] = value
end

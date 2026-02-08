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

-- vim.cmd(':packadd cfilter')
-- vim.api.nvim_create_autocmd('BufWinEnter', {
--   group = vim.api.nvim_create_augroup('quickfix_utils', { clear = true }),
--   desc = 'allow updating quickfix window',
--   pattern = 'quickfix',
--   callback = function(ctx)
--     vim.bo.modifiable = true
--     -- :vimgrep's quickfix window display format now 
--     -- includes start and end column 
--     -- (in vim and nvim) so adding 2nd format to match that
--     vim.bo.errorformat = '%f|%l col %c| %m,%f|%l col %c-%k| %m'
--     vim.keymap.set('n', '<C-s>', ':cgetbuffer | set nomodified | echo "quickfix/location list updated"<CR>',
--       { buffer = true, }
--     )
--   end,
-- })

-- terminal functionalities
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- keymap('t', 'qq', '<C-\\><C-n>', { noremap = true, silent = true, desc = 'Exit insert mode in terminal' })


local function create_float(command, opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.9)
  local height = opts.height or math.floor(vim.o.lines * 0.9)

  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local buf = vim.api.nvim_create_buf(false, true)

  local win_config = {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = 'rounded',
  }

  local _ = vim.api.nvim_open_win(buf, true, win_config)

  vim.cmd.term(command)
  -- vim.cmd(':wincmd J')
  -- vim.api.nvim_win_set_height(0, 15)
end

vim.keymap.set('n', '<space>gb', function(opts)
  local number = vim.api.nvim_get_current_buf()
  local name = vim.api.nvim_buf_get_name(number)
  local line, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local command = 'tig blame +' .. line .. ' ' .. name

  create_float(command, opts)
end, { desc = "Git blame with tig in float" })

vim.keymap.set('n', '<space>gf', function(opts)
  local number = vim.api.nvim_get_current_buf()
  local name = vim.api.nvim_buf_get_name(number)
  local command = 'tig log '  .. name

  create_float(command, opts)
end, { desc = "Git file history" })

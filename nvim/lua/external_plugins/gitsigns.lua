return {
  'lewis6991/gitsigns.nvim',
  config = function()
    local success, gitsigns = pcall(require, 'gitsigns')
    if not success then
      vim.notify 'Error loading plugin: gitsigns'
      return
    end

    gitsigns.setup {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 1000,
        ignore_whitespace = true,
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 10000,
      preview_config = {
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
    }

    vim.keymap.set('n', '<leader>gk', ':Gitsigns preview_hunk<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gu', ':Gitsigns reset_hunk<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gx', ':vert Gitsigns diffthis<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gz', ':wincmd p | q<CR>', { noremap = true, silent = true })

    vim.keymap.set('n', '<C-g>', '<Cmd>Gitsigns stage_hunk<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<C-b>', '<Cmd>Gitsigns stage_buffer<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gl', '<Cmd>Gitsigns blame_line<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gb', '<Cmd>Gitsigns blame<CR>', { noremap = true, silent = true })
  end,
}

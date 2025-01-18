return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = {},
  config = function()
    local success, oil = pcall(require, 'oil')
    if not success then
      vim.notify 'Failed to load plugin: oil'
      return
    end

    oil.setup {
      default_file_explorer = true,
      columns = {
        'icon',
        -- 'permissions',
        -- 'size',
        -- 'mtime',
      },

      buf_options = {},
      win_options = {},

      delete_to_trash = false,
      skip_confirm_for_simple_edits = false,
      watch_for_changes = false,

      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        ['<C-s>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open the entry in a vertical split' },
        ['<C-h>'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open the entry in a horizontal split' },
        ['<C-t>'] = { 'actions.select', opts = { tab = true }, desc = 'Open the entry in new tab' },
        ['<C-p>'] = 'actions.preview',
        ['<C-c>'] = 'actions.close',
        ['<C-l>'] = 'actions.refresh',
        ['-'] = 'actions.parent',
        ['_'] = 'actions.open_cwd',
        ['`'] = 'actions.cd',
        ['~'] = { 'actions.cd', opts = { scope = 'tab' }, desc = ':tcd to the current oil directory', mode = 'n' },
        ['gs'] = 'actions.change_sort',
        ['gx'] = 'actions.open_external',
        ['g.'] = 'actions.toggle_hidden',
        ['g\\'] = 'actions.toggle_trash',
      },

      use_default_keymaps = false,

      view_options = {
        show_hidden = true,
        -- This function defines what is considered a "hidden" file
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, '.')
        end,
        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, bufnr)
          return false
        end,
        natural_order = false,
        sort = {
          { 'type', 'asc' },
          { 'name', 'asc' },
        },
      },
    }

    vim.keymap.set('n', '<leader>-', '<cmd>Oil<CR>', { noremap = true, silent = true })
  end,
}

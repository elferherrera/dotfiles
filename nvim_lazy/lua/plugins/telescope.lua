return {
  -- githup repository for telescope
  'nvim-telescope/telescope.nvim',
  -- load when entering nvim
  event = 'UIEnter',
  -- specify dependencies of telescope
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      -- github repository for telescope-fzf-native
      'nvim-telescope/telescope-fzf-native.nvim',

      -- build using make
      build = 'make',

      -- require make to be installed
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    -- require('pluginsetup.zotero'),
  },
  config = function()
    -- use protected call to attempt to load telescope
    local success, telescope = pcall(require, 'telescope')
    if not success then
      vim.notify 'Failed to load plugin: telescope'
      return
    end

    local actions = require 'telescope.actions'
    telescope.setup {
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--hidden',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
        },
        path_display = { 'full' },
        layout_strategy = 'vertical',
        layout_config = { height = 0.80 },

        mappings = {
          i = {
            ['<c-enter>'] = 'to_fuzzy_refine',
            ['<c-h>'] = 'which_key',
          },
          n = {
            ['gg'] = actions.move_to_top,
            ['G'] = actions.move_to_bottom,
            ['<c-h>'] = 'which_key',
            ['<C-r>'] = require('telescope.actions').delete_buffer,
            ['<leader>q'] = require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist,
          },
        },

        -- ignore file that is not supposed to be found through telescope
        file_ignore_patterns = {
          '.git/',
          '%.bin',
          '%.check_cache',
          '%.dir',
          '%.docx',
          '%.gif',
          '%.jpg',
          '%.jpeg',
          '%.key',
          '%.marks',
          -- '%.md',
          '%.o',
          '%.out',
          '%.pdf',
          '%.png',
          '%.pptx',
          '%.pth',
          '%.pyc',
          '%.so',
          '%.vtu',
          '%.wav',
          '%.xlsx',
        },
      },
      pickers = {},
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- enable telescope extensions if they are installed
    local extensions = { 'fzf', 'ui-select', 'telescope-tabs' }
    for _, extension in pairs(extensions) do
      success, _ = pcall(require('telescope').load_extension, extension)
      if not success then
        vim.notify('Failed to load telescope extension ' .. extension)
        return
      end
    end

    -- custom keymaps for telescope
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', function()
      builtin.find_files { hidden = true }
    end, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}

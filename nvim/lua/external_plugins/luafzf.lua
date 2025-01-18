return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local success, fzflua = pcall(require, 'fzf-lua')
    if not success then
      vim.notify 'Failed to load plugin: fzf-lua'
      return
    end

    local actions = require 'fzf-lua.actions'
    fzflua.setup {
      border = 'none',
      winopts = {
        default = 'bat',
        preview = {
          title = false,
          layout = 'vertical',
          vertical = 'down:80%',
        },
      },
      keymap = {
        fzf = {
          ['ctrl-q'] = 'select-all+accept',
        },
      },
      files = {
        actions = {
          ['ctrl-h'] = actions.toggle_hidden,
        },
      },
      grep = {
        actions = {
          ['ctrl-h'] = actions.toggle_hidden,
        },
      },
    }

    local small_preview = {
      winopts = {
        split = 'belowright 10new',
        border = 'single',
        preview = {
          hidden = 'hidden',
          border = 'border',
          title = false,
          layout = 'horizontal',
          horizontal = 'right:50%',
        },
      },
    }

    vim.keymap.set('n', '<leader>sh', fzflua.helptags, { desc = '[s]earch [h]elp' })
    vim.keymap.set('n', '<leader>sk', fzflua.keymaps, { desc = '[s]earch [k]eymaps' })
    vim.keymap.set('n', '<leader>sf', fzflua.files, { desc = '[s]earch [f]iles' })

    vim.keymap.set('n', '<leader>sr', fzflua.resume, { desc = '[s]earch [R]esume last' })

    vim.keymap.set('n', '<leader>sg', fzflua.live_grep, { desc = '[s]earch live [g]rep' })
    vim.keymap.set('n', '<leader>sG', fzflua.grep, { desc = '[s]earch [G]rep' })

    vim.keymap.set('n', '<leader>sw', fzflua.grep_cword, { desc = '[s]earch current [w]word' })
    vim.keymap.set('n', '<leader>sW', fzflua.grep_cWORD, { desc = '[s]earch current [W]word' })

    vim.keymap.set('n', '<leader>sR', fzflua.registers, { desc = '[s]earch [R]egisters' })
    vim.keymap.set('n', '<leader>sM', fzflua.marks, { desc = '[s]earch [M]marks' })

    vim.keymap.set('n', '<leader>sp', fzflua.spell_suggest, { desc = '[s]earch s[p]elling suggestion' })

    vim.keymap.set('n', '<leader><leader>', function()
      fzflua.buffers()
    end, { desc = '[ ] Find existing buffers' })

    -- tabs
    vim.keymap.set('n', '<leader>tl', function()
      -- fzflua.tabs(small_preview)
      fzflua.tabs()
    end, { desc = '[ ] Find existing buffers' })
  end,
}

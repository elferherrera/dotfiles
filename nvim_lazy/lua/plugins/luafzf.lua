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

    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { desc = 'LSP: ' .. desc })
    end

    map('<leader>sh', fzflua.helptags, '[s]earch [h]elp')
    map('<leader>sk', fzflua.keymaps, '[s]earch [k]eymaps')
    map('<leader>sf', fzflua.files, '[s]earch [f]iles')
    map('<leader>sr', fzflua.resume, '[s]earch [R]esume last')
    map('<leader>sg', fzflua.live_grep, '[s]earch live [g]rep')
    map('<leader>sG', fzflua.grep, '[s]earch [G]rep')
    map('<leader>sw', fzflua.grep_cword, '[s]earch current [w]word')
    map('<leader>sW', fzflua.grep_cWORD, '[s]earch current [W]word')
    map('<leader>sR', fzflua.registers, '[s]earch [R]egisters')
    map('<leader>sM', fzflua.marks, '[s]earch [M]marks')
    map('<leader>sp', fzflua.spell_suggest, '[s]earch s[p]elling suggestion')
    map('<leader><leader>', function()
      fzflua.buffers()
    end, '[ ] Find existing buffers')

    -- tabs
    map('<leader>tl', function()
      fzflua.tabs()
    end, '[t]ab [l]ist')

    -- LSP shortcuts
    map('<leader>cgD', require('fzf-lua').lsp_definitions, '[G]oto [D]efinitions')
    map('<leader>cgr', require('fzf-lua').lsp_references, '[G]oto [R]eferences')
    map('<leader>cgi', require('fzf-lua').lsp_implementations, '[G]oto [I]mplementation')
    map('<leader>cD', require('fzf-lua').lsp_typedefs, 'Type [D]efinition')
    map('<leader>csd', require('fzf-lua').lsp_document_symbols, '[D]ocument [S]ymbols')
    map('<leader>csw', require('fzf-lua').lsp_workspace_symbols, '[W]orkspace [S]ymbols')
    map('<leader>cdd', require('fzf-lua').diagnostics_document, '[d]iagnostics [d]ocument')
    map('<leader>cdw', require('fzf-lua').diagnostics_workspace, '[d]iagnostics [w]orkspace')
  end,
}

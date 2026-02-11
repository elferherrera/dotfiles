vim.opt.completeopt = { "menuone", "noselect" }

require("luasnip.loaders.from_vscode").lazy_load()

require('blink-cmp').setup({
  signature = { enabled = true },
  keymap = {
    -- set to 'none' to disable the 'default' preset
    preset = 'default',

    -- disable a keymap from the preset
    -- ['<C-e>'] = false, -- or {}

    -- show with a list of providers
    ['<C-space>'] = {
      function(cmp) cmp.show({}) end,
      function(cmp) cmp.show_documentation() end,
      function(cmp) cmp.hide_documentation() end
    },
  },
  completion = {
    list = {
      selection = {
        preselect = false,
        auto_insert = false
      }
    },
    documentation = { auto_show = false, auto_show_delay_ms = 500 },
    menu = {
      auto_show = true,
      draw = {
        treesitter = { "lsp " },
        columns = {
          { "kind_icon", "label", "label_description", gap = 1 }, { "kind" }
        },
      }
    },
    -- trigger = {
    --   show_on_x_blocked_trigger_characters = { "." },
    -- }
  },
  -- sources = {
  -- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
  -- default = { 'lsp', 'path', 'snippets' },
  -- },
  -- -- Use a preset for snippets, check the snippets documentation for more information
  -- snippets = { preset = 'default' | 'luasnip' | 'mini_snippets' | 'vsnip' },
})

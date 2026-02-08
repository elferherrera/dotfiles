require('blink-cmp').setup({
  keymap = {
    -- set to 'none' to disable the 'default' preset
    preset = 'default',

    -- disable a keymap from the preset
    -- ['<C-e>'] = false, -- or {}

    -- show with a list of providers
    ['<C-,>'] = {
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
    menu = {
      auto_show = false,
      draw = {
        columns = {
          { "label",     "label_description", gap = 1 },
          { "kind_icon", "kind" }
        },
      }
    },
    -- trigger = {
    --   show_on_x_blocked_trigger_characters = { "." },
    -- }
  },
  sources = {
    -- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
    -- default = { 'lsp', 'path', 'snippets' },
  },

  -- -- Use a preset for snippets, check the snippets documentation for more information
  -- snippets = { preset = 'default' | 'luasnip' | 'mini_snippets' | 'vsnip' },

})

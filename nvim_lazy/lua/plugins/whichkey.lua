return {
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts_extend = { 'spec' },
  opts = {
    preset = 'helix',
    defaults = {},
    icons = {
      -- set icon mappings to true if you have a Nerd Font
      mappings = vim.g.have_nerd_font,
      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
      -- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    },

    -- Document existing key chains
    spec = {
      { '<leader>c', group = '[c]ode', mode = { 'n', 'x' } },
      { '<leader>cg', group = '[c]ode [g]o', mode = { 'n', 'x' } },
      { '<leader>f', group = '[f]ind' },
      { '<leader>g', group = '[g]it' },
      { '<leader>s', group = '[s]earch' },
      { '<leader>t', group = '[t]abs' },
      { '<leader>n', group = 'Termi[n]al' },
      { '<leader>r', group = 'Su[r]round' },
      { '<leader>z', group = '[z]Fold' },
      { '<leader>l', group = '[l]ists' },
      { '<leader>b', group = '[b]harpoon' },
    },
  },
}

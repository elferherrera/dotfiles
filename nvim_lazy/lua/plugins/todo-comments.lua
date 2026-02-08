return {
  'folke/todo-comments.nvim',

  event = 'UIEnter',

  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  opts = {

    signs = false,

    keywords = {

      BUGS = { icon = '', color = 'error' },
      TODO = { icon = '', color = 'warning' },
      NOTE = { icon = '', color = 'hint' },
    },

    highlight = {
      before = '',
      after = 'fg',
    },

    gui_style = {
      fg = 'BOLD',
      bg = 'BOLD',
    },
  },
}

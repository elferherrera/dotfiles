-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

local options = {
  shell = '/bin/bash',

  -- Enable mouse mode, can be useful for resizing splits for example!
  mouse = '',

  -- Don't show the mode, since it's already in the status line
  showmode = false,

  cmdwinheight = 15,

  -- Enable break indent
  breakindent = true,

  -- Decrease update time
  updatetime = 250,

  -- Decrease mapped sequence wait time
  -- Displays which-key popup sooner
  timeoutlen = 300,

  -- Sets how neovim will display certain whitespace characters in the editor.
  --  See `:help 'list'`
  --  and `:help 'listchars'`
  list = true,
  listchars = { tab = '» ', trail = '·', nbsp = '␣' },

  -- Preview substitutions live, as you type!
  inccommand = 'split',

  -- Show which line your cursor is on
  cursorline = true,

  -- the font used in graphical neovim application
  guifont = 'monospace:h16',
  -- use the proper color
  termguicolors = true,

  -- only need to display one line for commands
  cmdheight = 1,
  -- pop up menu height
  pumheight = 10,

  -- hide tabline
  showtabline = 0,

  -- enable highlighting empty spaces
  virtualedit = 'block',

  -- options to configure the left column
  -- display relative line numbers
  relativenumber = true,
  -- display the current line number
  number = true,
  -- set the width of number column
  numberwidth = 4,
  -- add a column next to line number for signs
  signcolumn = 'yes',

  -- options to configure how tab behaves
  -- convert tabs into spaces
  expandtab = true,
  -- the number of spaces for each indentation
  shiftwidth = 2,
  -- the number of spaces for each tab
  tabstop = 2,

  -- options to configure how texts are shown in a window
  -- no text wrapping (ugly)
  wrap = true,
  -- automatic indentation
  smartindent = true,
  -- keeps cursor in the middle
  scrolloff = 0,
  -- minimal number of screen columns to the left and right of the cursor
  sidescrolloff = 6,

  -- options to configure how search works
  -- highlight all words that match the search pattern
  hlsearch = true,
  -- search is case-insensitive
  ignorecase = true,
  -- but if our search contains uppercase(s), it become case-sensitive
  smartcase = true,

  -- options to configure how multiple panes behave
  -- for a vertical split, the new window goes to the bottom
  splitbelow = true,
  -- for a horizontal split, the new window goes to the right
  splitright = true,

  -- options to configure how text folding works
  fillchars = {
    eob = ' ', -- removes tilde from number column in a short file
    fold = '-', -- replace dots from trailing fold characters
  },

  -- new files open with everything unfolded
  foldlevelstart = 99,
  -- keep colors of folded lines
  foldtext = '',

  -- miscellaneous
  -- do not creates a backup file
  backup = false,
  -- if a file is being edited in another program
  writebackup = false,

  -- do not creates a swapfile
  swapfile = false,
  -- enable persistent undo
  undofile = true,

  -- the encoding written to a file
  fileencoding = 'utf-8',
}

for parameter, value in pairs(options) do
  vim.opt[parameter] = value
end

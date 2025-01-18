local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

-- install lazy from github repository if it is not installed
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- github repository for lazy
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'

  -- command to clone repository
  local out = vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  }

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- use protected call to load lazy
local success, lazy = pcall(require, 'lazy')
if not success then
  vim.notify 'Failed to load plugin: lazy'
  return
end

-- all plugin settings are in this directory
local location = 'external_plugins.'

lazy.setup({
  change_detection = {
    enabled = false,
    notify = false,
  },

  performance = {
    cache = {
      enabled = true,
    },

    reset_packpath = true,

    rtp = {
      reset = true,
      disabled_plugins = {
        'gzip',
        'matchit',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },

  spec = {
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    { 'Bilal2453/luvit-meta', lazy = true },
    -- {
    --   'folke/tokyonight.nvim',
    --   priority = 1000,
    --   init = function()
    --     vim.cmd.colorscheme 'tokyonight-night'
    --     vim.cmd.hi 'Comment gui=none'
    --   end,
    -- },
    {
      'catppuccin/nvim',
      priority = 1000,
      init = function()
        vim.cmd.colorscheme 'catppuccin'
        vim.cmd.hi 'Comment gui=none'
      end,
    },
    { import = location .. 'treesitter' },
    { import = location .. 'whichkey' },
    { import = location .. 'gitsigns' },
    { import = location .. 'luafzf' },
    { import = location .. 'lazydev' },
    { import = location .. 'mini' },
    { import = location .. 'oil' },
    { import = location .. 'flash' },
    { import = location .. 'gitlinker' },
    { import = location .. 'rest' },
    { import = location .. 'markdown' },
    { import = location .. 'todo-comments' },
    { import = location .. 'autopairs' },
    { import = location .. 'conform' },
    { import = location .. 'go' },
    { import = location .. 'lsp' },
    { import = location .. 'blink' },
    --
    -- { import = location .. 'cmp' },
    -- { import = location .. 'telescope' },
    -- { import = location .. 'fugitive' },
  },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- init.lua

-- Set leader key before plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load core configuration modules
require('config.options')
require('config.keymaps')

-- Setup lazy.nvim and load plugins
require('lazy').setup({
  spec = {
    { import = 'plugins' },
    { import = 'plugins.snacks' },
    { import = 'plugins.navigation' },
    { import = 'plugins.testing' },
    { import = 'plugins.dap' },
    { import = 'plugins.markdown' },
    { import = 'plugins.leetcode' },
    { import = 'plugins.copilot' },
  },
  ui = {
    border = 'rounded',
  },
  -- This will generate a lockfile to prevent dependency issues
  lockfile = vim.fn.stdpath('data') .. '/lazy-lock.json',
})

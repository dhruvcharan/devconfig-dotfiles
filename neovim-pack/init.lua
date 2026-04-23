-- init.lua (Native Plugin Manager version)

-- 1. Enable fast loading (Available since Neovim 0.9+)
if vim.loader then
  vim.loader.enable()
end

-- 2. Set leader keys (must be set before plugins are loaded)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 3. Native Bootstrapper
-- This function clones a git repo into the native 'pack' directory
local function bootstrap(plugins)
  local pack_path = vim.fn.stdpath('config') .. '/pack/plugins/start'
  for name, spec in pairs(plugins) do
    local repo = type(spec) == 'string' and spec or spec.repo
    local branch = type(spec) == 'table' and spec.branch or nil
    
    local install_path = pack_path .. '/' .. name
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
      print('Installing plugin: ' .. name)
      local cmd = { 'git', 'clone', '--depth', '1' }
      if branch then
        table.insert(cmd, '--branch')
        table.insert(cmd, branch)
      end
      table.insert(cmd, 'https://github.com/' .. repo)
      table.insert(cmd, install_path)
      vim.fn.system(cmd)
    end
  end
end

-- 4. Load Plugin List and Bootstrap
local plugins_module = require('plugins.init')
bootstrap(plugins_module.plugins)

-- 5. Load Core Configuration
require('config.options')
require('config.keymaps')

-- 6. Plugin Setup
plugins_module.setup()

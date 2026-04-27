-- init.lua (Native Plugin Manager version)

-- 1. Set leader keys (MUST BE AT THE VERY TOP)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 2. Load Core Options (Must be early for timeoutlen etc)
require('config.options')

-- 3. Enable fast loading
if vim.loader then
  vim.loader.enable()
end

-- 4. Native Bootstrapper & Runtimepath Loader
local function bootstrap_and_load(plugins)
  local pack_path = vim.fn.stdpath('config') .. '/pack/plugins/start'
  vim.fn.mkdir(pack_path, "p")

  for name, spec in pairs(plugins) do
    local repo = type(spec) == 'string' and spec or spec.repo
    local branch = type(spec) == 'table' and spec.branch or nil
    local install_path = pack_path .. '/' .. name

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
      print('Installing plugin: ' .. name)
      local cmd = { 'git', 'clone', '--depth', '1' }
      if branch then
        table.insert(cmd, '--branch'); table.insert(cmd, branch)
      end
      table.insert(cmd, 'https://github.com/' .. repo)
      table.insert(cmd, install_path)
      vim.fn.system(cmd)
    end

    -- CRITICAL: Add to runtimepath so we can 'require' them in this file
    vim.opt.rtp:prepend(install_path)
  end
end

-- 5. Load Plugin List and Load them into RTP
local plugins_module = require('plugins.init')
bootstrap_and_load(plugins_module.plugins)
-- 6. Plugin Setup
plugins_module.setup()

-- 7. Load Keymaps
require('config.keymaps')

-- 8. Final heartbeat
vim.schedule(function()
  print("🚀 Neovim Pack Active | Leader: [Space] | <leader>P for Commands")
end)


-- lua/config/keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ## Navigation & File Management (Oil, Snacks Explorer) ##
map('n', '-', '<CMD>Oil<CR>', { desc = 'Open Parent Directory (Oil)' })
map('n', '<leader>fo', '<CMD>Oil --float<CR>', { desc = 'Oil Float' })
map('n', '<leader>e', '<Cmd>lua Snacks.explorer()<CR>', { desc = 'File Explorer' })

-- ## Debugging (DAP) ##
map('n', '<leader>db', function() require('dap').toggle_breakpoint() end, { desc = 'Toggle Breakpoint' })
map('n', '<leader>dc', function() require('dap').continue() end, { desc = 'Continue (Start Debug)' })
map('n', '<leader>di', function() require('dap').step_into() end, { desc = 'Step Into' })
map('n', '<leader>do', function() require('dap').step_over() end, { desc = 'Step Over' })
map('n', '<leader>dO', function() require('dap').step_out() end, { desc = 'Step Out' })
map('n', '<leader>dt', function() require('dapui').toggle() end, { desc = 'Toggle Debug UI' })
map('n', '<leader>de', function() require('dapui').eval() end, { desc = 'Evaluate Expression' })

-- ## Testing (Neotest) ##
map('n', '<leader>tt', function() require('neotest').run.run() end, { desc = 'Run Nearest Test' })
map('n', '<leader>tf', function() require('neotest').run.run(vim.fn.expand('%')) end, { desc = 'Run Test File' })
map('n', '<leader>ts', function() require('neotest').summary.toggle() end, { desc = 'Toggle Test Summary' })
map('n', '<leader>to', function() require('neotest').output.open({ enter = true, auto_close = true }) end, { desc = 'Show Test Output' })
map('n', '<leader>tO', function() require('neotest').output_panel.toggle() end, { desc = 'Toggle Test Output Panel' })

-- ## Outline & Symbols (Aerial) ##
map('n', '<leader>co', '<cmd>AerialToggle! left<cr>', { desc = 'Code Outline' })

-- ## Sessions (Persistence) ##
map('n', '<leader>qs', function() require('persistence').load() end, { desc = 'Restore Session' })
map('n', '<leader>ql', function() require('persistence').load({ last = true }) end, { desc = 'Restore Last Session' })
map('n', '<leader>qd', function() require('persistence').stop() end, { desc = "Don't Save Current Session" })

-- ## Snacks Picker (Files, Grep, etc) ##
map('n', '<leader>fg', function() 
  Snacks.picker.grep({ 
    cwd = vim.fn.stdpath("config"), 
    glob = "README.md",
    title = "Search Neovim Guide"
  }) 
end, { desc = 'Search Config Guide' })
map('n', '<leader><space>', '<Cmd>lua Snacks.picker.smart()<CR>', { desc = 'Smart Find Files' })
map('n', '<leader>,', '<Cmd>lua Snacks.picker.buffers()<CR>', { desc = 'Buffers' })
map('n', '<leader>/', '<Cmd>lua Snacks.picker.grep()<CR>', { desc = 'Grep' })
map('n', '<leader>:', '<Cmd>lua Snacks.picker.command_history()<CR>', { desc = 'Command History' })
map('n', '<leader>ff', '<Cmd>lua Snacks.picker.files()<CR>', { desc = 'Find Files' })
map('n', '<leader>fr', '<Cmd>lua Snacks.picker.recent()<CR>', { desc = 'Recent' })
map('n', '<leader>sk', '<Cmd>lua Snacks.picker.keymaps()<CR>', { desc = 'Keymaps' })
map('n', '<leader>th', '<Cmd>lua Snacks.picker.colorschemes()<CR>', { desc = 'Select Theme' })

-- ## Git (Snacks & Gitsigns) ##
map('n', '<leader>gg', '<Cmd>lua Snacks.lazygit()<CR>', { desc = 'Lazygit' })
map('n', '<leader>gb', '<Cmd>lua Snacks.git.blame_line()<CR>', { desc = 'Git Blame Line' })
map('n', '<leader>gl', '<Cmd>lua Snacks.git.log_file()<CR>', { desc = 'File History' })

-- ## LSP Keymaps ##
map('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
map('n', 'gr', vim.lsp.buf.references, { desc = 'Go to References' })
map('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to Implementation' })
map('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
map('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename Symbol' })
map('n', '<leader>cf', function() vim.lsp.buf.format({ async = true }) end, { desc = 'Format Code' })

-- ## Structural Editing (Treesitter) ##
map('n', '<leader>v', '<Cmd>lua require("nvim-treesitter.incremental_selection").init_selection()<CR>', { desc = 'Start Structural Selection' })
map('x', '<leader>v', '<Cmd>lua require("nvim-treesitter.incremental_selection").node_incremental()<CR>', { desc = 'Expand Selection' })
map('x', '<bs>', '<Cmd>lua require("nvim-treesitter.incremental_selection").node_decremental()<CR>', { desc = 'Shrink Selection' })

-- ## AI Assistant (Gemini) ##
map({ 'n', 't' }, '<C-g>', function() Snacks.terminal.toggle("gemini") end, { desc = 'Toggle Gemini Chat' })
map('n', '<leader>ai', function() Snacks.terminal.toggle("gemini") end, { desc = 'Gemini Chat (Toggle)' })
map('v', '<leader>ar', function()
  -- Get the current selection
  vim.cmd('noautocmd normal! "vy')
  local selection = vim.fn.getreg('v')
  -- Open Gemini with the selection as a refactor prompt
  local prompt = "Refactor this code for better readability and efficiency:\n\n" .. selection
  Snacks.terminal("gemini", { args = { "-i", prompt } })
end, { desc = 'Refactor with Gemini' })

-- ## UI Toggles ##
map('n', '<leader>sv', '<Cmd>source $MYVIMRC<CR>', { desc = 'Source Neovim Config' })
map('n', '<leader>cc', '<Cmd>lua Snacks.terminal("cal-today")<CR>', { desc = 'Show Today\'s OS Calendar' })
map('n', '<leader>z', '<Cmd>lua Snacks.zen()<CR>', { desc = 'Toggle Zen Mode' })
map('n', '<leader>Z', '<Cmd>lua Snacks.zen.zoom()<CR>', { desc = 'Toggle Zoom' })
map('n', '<leader>n', '<Cmd>lua Snacks.notifier.show_history()<CR>', { desc = 'Notification History' })

-- ## Buffer & Window Management ##
map('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window' })

map('n', '<leader>bd', '<Cmd>lua Snacks.bufdelete()<CR>', { desc = 'Delete Buffer' })
map('n', '<leader>w', '<Cmd>w<CR>', { desc = 'Save File' })
map('n', '<leader>q', '<Cmd>q<CR>', { desc = 'Quit Neovim' })

-- ## Search & Other ##
map('n', '<leader>h', '<Cmd>noh<CR>', { desc = 'Clear Search Highlight' })

-- ## Obsidian ##
map('n', '<leader>od', '<Cmd>ObsidianToday<CR>', { desc = 'Daily Note' })
map('n', '<leader>on', '<Cmd>ObsidianNew<CR>', { desc = 'New Note' })
map('n', '<leader>os', '<Cmd>ObsidianSearch<CR>', { desc = 'Search Notes' })
map('n', '<leader>oo', '<Cmd>ObsidianOpen<CR>', { desc = 'Open in App' })
map('n', '<leader>ot', '<Cmd>ObsidianTemplate<CR>', { desc = 'Insert Template' })



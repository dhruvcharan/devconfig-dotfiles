
-- lua/config/keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Fix for leader key behavior (Space moving cursor)
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- ## Smart Window Navigation ##
-- Seamlessly move between windows and Snacks explorer
map('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window' })

-- ## Navigation & File Management (Oil, Snacks Explorer) ##
map('n', '-', '<CMD>Oil<CR>', { desc = 'Open Parent Directory (Oil)' })
map('n', '<leader>fo', '<CMD>Oil --float<CR>', { desc = 'Oil Float' })
map('n', '<leader>e', '<Cmd>lua Snacks.explorer()<CR>', { desc = 'File Explorer' })

-- ## IDE Style Navigation & Tabbing ##
map('n', 'H', '<Cmd>bprevious<CR>', { desc = 'Previous Buffer' })
map('n', 'L', '<Cmd>bnext<CR>', { desc = 'Next Buffer' })
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous Diagnostic' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })
map('n', '[q', '<cmd>cprev<cr>', { desc = 'Previous Quickfix' })
map('n', ']q', '<cmd>cnext<cr>', { desc = 'Next Quickfix' })

-- ## Window Management ##
map('n', '<leader>w', '<C-w>', { desc = 'Window Prefix' })
map('n', '<leader>w|', '<C-w>v', { desc = 'Split Vertical' })
map('n', '<leader>w-', '<C-w>s', { desc = 'Split Horizontal' })
map('n', '<leader>we', '<C-w>=', { desc = 'Equalize Windows' })
map('n', '<leader>wx', '<Cmd>close<CR>', { desc = 'Close Window' })

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
map('n', '<leader><space>', '<Cmd>lua Snacks.picker.smart()<CR>', { desc = 'Smart Find Files' })
map('n', '<leader>,', '<Cmd>lua Snacks.picker.buffers()<CR>', { desc = 'Buffers' })
map('n', '<leader>/', '<Cmd>lua Snacks.picker.grep()<CR>', { desc = 'Grep (Root)' })
map('n', '<leader>:', '<Cmd>lua Snacks.picker.command_history()<CR>', { desc = 'Command History' })
-- Search Group
map('n', '<leader>ff', '<Cmd>lua Snacks.picker.files()<CR>', { desc = 'Find Files' })
map('n', '<leader>fg', '<Cmd>lua Snacks.picker.git_files()<CR>', { desc = 'Find Git Files' })
map('n', '<leader>fm', function() Snacks.picker.grep({ glob = "*.md", title = "Search Markdown" }) end, { desc = 'Search Markdown' })
map('n', '<leader>fr', '<Cmd>lua Snacks.picker.recent()<CR>', { desc = 'Recent' })
map({ 'n', 'x' }, '<leader>fw', '<Cmd>lua Snacks.picker.grep_word()<CR>', { desc = 'Visual selection or word' })
map('n', '<leader>fs', '<Cmd>lua Snacks.picker.lsp_symbols()<CR>', { desc = 'LSP Symbols' })
map('n', '<leader>fd', '<Cmd>lua Snacks.picker.diagnostics()<CR>', { desc = 'Diagnostics' })
map('n', '<leader>sR', '<Cmd>lua Snacks.picker.resume()<CR>', { desc = 'Resume' })
map('n', '<leader>su', '<Cmd>lua Snacks.picker.undo()<CR>', { desc = 'Undo History' })
map('n', '<leader>sp', '<Cmd>lua Snacks.picker.pickers()<CR>', { desc = 'Pickers' })
map('n', '<leader>P', '<Cmd>lua Snacks.picker.commands()<CR>', { desc = 'Command Palette' })
map('n', '<leader>sk', '<Cmd>lua Snacks.picker.keymaps()<CR>', { desc = 'Keymaps' })
map('n', '<leader>th', '<Cmd>lua Snacks.picker.colorschemes()<CR>', { desc = 'Select Theme' })

-- ## Git (Snacks & Gitsigns) ##
map('n', '<leader>gg', '<Cmd>lua Snacks.lazygit()<CR>', { desc = 'Lazygit' })
map('n', '<leader>gb', '<Cmd>lua Snacks.git.blame_line()<CR>', { desc = 'Git Blame Line' })
map('n', '<leader>gl', '<Cmd>lua Snacks.git.log_file()<CR>', { desc = 'File History' })
map('n', ']h', '<cmd>Gitsigns next_hunk<CR>', { desc = 'Next Hunk' })
map('n', '[h', '<cmd>Gitsigns prev_hunk<CR>', { desc = 'Prev Hunk' })

-- ## LSP Keymaps ##
map('n', 'gd', '<cmd>lua Snacks.picker.lsp_definitions()<cr>', { desc = 'Go to Definition' })
map('n', 'gr', '<cmd>lua Snacks.picker.lsp_references()<cr>', { desc = 'Go to References' })
map('n', 'gi', '<cmd>lua Snacks.picker.lsp_implementations()<cr>', { desc = 'Go to Implementation' })
map('n', 'gt', '<cmd>lua Snacks.picker.lsp_type_definitions()<cr>', { desc = 'Go to Type Definition' })
map('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
map('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename Symbol' })
map('n', '<leader>cf', function() vim.lsp.buf.format({ async = true }) end, { desc = 'Format Code' })

-- ## Trouble & Todo-Comments ##
map('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics (Trouble)' })
map('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = 'Buffer Diagnostics (Trouble)' })
map('n', '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', { desc = 'Symbols (Trouble)' })
map('n', '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.relative=win win.position=right<cr>', { desc = 'LSP Definitions / references / ... (Trouble)' })
map('n', '<leader>xL', '<cmd>Trouble loclist toggle<cr>', { desc = 'Location List (Trouble)' })
map('n', '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', { desc = 'Quickfix List (Trouble)' })
map('n', '<leader>xt', '<cmd>TodoTrouble<cr>', { desc = 'Todo (Trouble)' })

-- ## AI Assistant (Gemini) ##
-- Configure Gemini to open in a right split by default
local function toggle_gemini()
  Snacks.terminal.toggle("gemini", {
    win = {
      position = "right",
      width = 0.35,
    }
  })
end

map({ 'n', 't' }, '<C-g>', toggle_gemini, { desc = 'Toggle Gemini Chat (Right Split)' })
map('n', '<leader>ai', toggle_gemini, { desc = 'Gemini Chat (Right Split)' })
map('v', '<leader>ar', function()
  -- Get the current selection
  vim.cmd('noautocmd normal! "vy')
  local selection = vim.fn.getreg('v')
  -- Open Gemini with the selection as a refactor prompt
  local prompt = "Refactor this code for better readability and efficiency:\n\n" .. selection
  Snacks.terminal("gemini", { 
    args = { "-i", prompt },
    win = { position = "right", width = 0.35 }
  })
end, { desc = 'Refactor with Gemini' })

-- ## Buffer & Session Management ##
map('n', '<leader>bd', '<Cmd>lua Snacks.bufdelete()<CR>', { desc = 'Delete Buffer' })
map('n', '<leader>bo', '<Cmd>%bd|e#|bd#<CR>', { desc = 'Delete Other Buffers' })
map('n', '<leader>w', '<Cmd>w<CR>', { desc = 'Save File' })
map('n', '<leader>q', '<Cmd>q<CR>', { desc = 'Quit Neovim' })

-- ## UI Toggles ##
map('n', '<leader>sv', '<Cmd>source $MYVIMRC<CR>', { desc = 'Source Neovim Config' })
map('n', '<leader>cc', '<Cmd>lua Snacks.terminal("cal-today")<CR>', { desc = 'Show Today\'s OS Calendar' })
map('n', '<leader>z', '<Cmd>lua Snacks.zen()<CR>', { desc = 'Toggle Zen Mode' })
map('n', '<leader>Z', '<Cmd>lua Snacks.zen.zoom()<CR>', { desc = 'Toggle Zoom' })
map('n', '<leader>n', '<Cmd>lua Snacks.notifier.show_history()<CR>', { desc = 'Notification History' })

-- ## UI Toggles ##

map('n', '<leader>h', '<Cmd>noh<CR>', { desc = 'Clear Search Highlight' })

-- ## Obsidian ##
map('n', '<leader>od', '<Cmd>ObsidianToday<CR>', { desc = 'Daily Note' })
map('n', '<leader>on', '<Cmd>ObsidianNew<CR>', { desc = 'New Note' })
map('n', '<leader>os', '<Cmd>ObsidianSearch<CR>', { desc = 'Search Notes' })
map('n', '<leader>oo', '<Cmd>ObsidianOpen<CR>', { desc = 'Open in App' })
map('n', '<leader>ot', '<Cmd>ObsidianTemplate<CR>', { desc = 'Insert Template' })



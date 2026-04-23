-- lua/config/options.lua

local opt = vim.opt

-- ## Appearance ##
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.number = true        -- Show line numbers
opt.relativenumber = true  -- Show relative line numbers
opt.wrap = true          -- Wrap lines (essential for `linebreak` to work)
opt.linebreak = true     -- Wrap long lines at word boundaries
opt.breakindent = true   -- Maintain indent level when wrapping lines
opt.scrolloff = 8        -- Keep 8 lines of context around the cursor
opt.sidescrolloff = 8
opt.showmode = false     -- Don't show the mode, handled by statusline
opt.cursorline = true    -- Highlight the current line
opt.signcolumn = 'yes'   -- Always show the sign column (for LSP diagnostics, Git integration, etc.)

-- ## Behavior ##
opt.clipboard = 'unnamedplus' -- Use system clipboard
opt.mouse = 'a'               -- Enable mouse support
opt.autoindent = true         -- Auto indenting
opt.confirm = true            -- Ask for confirmation when quitting with unsaved changes

-- ## Searching ##
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true  -- But respect case if an uppercase letter is used
opt.hlsearch = true   -- Highlight all matches when searching
opt.incsearch = true  -- Show search matches as you type

-- ## Tabs & Indentation ##
opt.expandtab = true     -- Use spaces instead of tabs
opt.shiftwidth = 2       -- Size of an indent
opt.tabstop = 2          -- Number of spaces a <Tab> is
opt.smartindent = true   -- Be smart about indentation
opt.conceallevel = 2     -- Hide * markup for bold and italic, etc.

-- ## Performance ##
opt.updatetime = 250 -- ms to wait for trigger "CursorHold"
opt.undofile = true  -- Persistent undo

-- ## Splits ##
opt.splitbelow = true    -- New horizontal splits open below the current window.
opt.splitright = true    -- New vertical splits open to the right of the current window.

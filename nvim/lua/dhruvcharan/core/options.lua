vim.cmd("let g:netrw_liststyle = 3") 

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.confirm = true -- confirm before closing unsaved files

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true -- highlight the current line

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

opt.mouse = "a" -- enable mouse in all modes

opt.scrolloff = 8 -- keep 8 lines visible when scrolling
opt.sidescrolloff = 8 -- keep 8 columns visible when scrolling horizontally

opt.linebreak = true -- wrap lines at word boundaries
opt.breakindent = true -- visually indent wrapped lines

-- Buffer handling
opt.hidden = true       -- Allow modified buffers in background
opt.autowriteall = true -- Auto-save when switching buffers or closing vim
opt.confirm = true      -- Ask for confirmation when handling unsaved or read-only files

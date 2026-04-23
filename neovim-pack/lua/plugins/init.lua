-- lua/plugins/init.lua
local M = {}

-- Comprehensive Plugin List
M.plugins = {
  -- Core & UI
  ['mini.nvim'] = 'echasnovski/mini.nvim',
  ['snacks.nvim'] = 'folke/snacks.nvim',
  ['gruvbox.nvim'] = 'ellisonleao/gruvbox.nvim',
  ['tokyonight.nvim'] = 'folke/tokyonight.nvim',
  ['catppuccin'] = 'catppuccin/nvim',
  ['rose-pine'] = 'rose-pine/neovim',
  ['which-key.nvim'] = 'folke/which-key.nvim',
  ['plenary.nvim'] = 'nvim-lua/plenary.nvim',
  ['nvim-web-devicons'] = 'nvim-tree/nvim-web-devicons',
  ['dressing.nvim'] = 'stevearc/dressing.nvim',
  ['trouble.nvim'] = 'folke/trouble.nvim',
  ['transparent.nvim'] = 'xiyaowong/transparent.nvim',

  -- Navigation
  ['oil.nvim'] = 'stevearc/oil.nvim',
  ['aerial.nvim'] = 'stevearc/aerial.nvim',
  ['persistence.nvim'] = 'folke/persistence.nvim',
  ['harpoon'] = { repo = 'ThePrimeagen/harpoon', branch = 'harpoon2' },
  ['flash.nvim'] = 'folke/flash.nvim',
  ['undotree'] = 'mbbill/undotree',

  -- LSP & Coding
  ['nvim-lspconfig'] = 'neovim/nvim-lspconfig',
  ['mason.nvim'] = 'williamboman/mason.nvim',
  ['mason-lspconfig.nvim'] = 'williamboman/mason-lspconfig.nvim',
  ['fidget.nvim'] = 'j-hui/fidget.nvim',
  ['nvim-cmp'] = 'hrsh7th/nvim-cmp',
  ['cmp-nvim-lsp'] = 'hrsh7th/cmp-nvim-lsp',
  ['cmp-buffer'] = 'hrsh7th/cmp-buffer',
  ['cmp-path'] = 'hrsh7th/cmp-path',
  ['cmp_luasnip'] = 'saadparwaiz1/cmp_luasnip',
  ['LuaSnip'] = 'L3MON4D3/LuaSnip',
  ['conform.nvim'] = 'stevearc/conform.nvim',
  ['copilot.lua'] = 'zbirenbaum/copilot.lua',
  ['todo-comments.nvim'] = 'folke/todo-comments.nvim',

  -- Treesitter
  ['nvim-treesitter'] = 'nvim-treesitter/nvim-treesitter',
  ['nvim-treesitter-textobjects'] = 'nvim-treesitter/nvim-treesitter-textobjects',

  -- Git
  ['gitsigns.nvim'] = 'lewis6991/gitsigns.nvim',

  -- Debugging & Testing
  ['nvim-dap'] = 'mfussenegger/nvim-dap',
  ['nvim-dap-ui'] = 'rcarriga/nvim-dap-ui',
  ['nvim-nio'] = 'nvim-neotest/nvim-nio',
  ['nvim-dap-python'] = 'mfussenegger/nvim-dap-python',
  ['nvim-dap-go'] = 'leoluz/nvim-dap-go',
  ['nvim-dap-virtual-text'] = 'theHamsta/nvim-dap-virtual-text',
  ['neotest'] = 'nvim-neotest/neotest',
  ['neotest-python'] = 'nvim-neotest/neotest-python',
  ['neotest-go'] = 'nvim-neotest/neotest-go',
  ['antlr4'] = 'antlr/antlr4',

  -- Specific Tools
  ['leetcode.nvim'] = 'kawre/leetcode.nvim',
  ['nui.nvim'] = 'MunifTanjim/nui.nvim',
  ['telescope.nvim'] = 'nvim-telescope/telescope.nvim',
  ['markdown-preview.nvim'] = 'iamcco/markdown-preview.nvim',
  ['obsidian.nvim'] = 'epwalsh/obsidian.nvim',
  ['render-markdown.nvim'] = 'MeanderingProgrammer/render-markdown.nvim',
}

M.setup = function()
  -- 1. Theme
  require('gruvbox').setup({ terminal_colors = true })
  vim.cmd.colorscheme('gruvbox')

  -- 2. Snacks (Priority)
  require('snacks').setup({
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    zen = { enabled = true },
    lazygit = { enabled = true },
    terminal = { enabled = true },
    git = { enabled = true },
  })

  -- 3. Mini
  require('mini.ai').setup()
  require('mini.surround').setup()
  require('mini.pairs').setup()
  require('mini.comment').setup()
  require('mini.bufremove').setup()
  require('mini.statusline').setup({ use_icons = true, set_vim_settings = false })

  -- 4. LSP & Completion
  local cmp = require('cmp')
  local luasnip = require('luasnip')
  cmp.setup({
    snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
    mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({ { name = 'nvim_lsp' }, { name = 'luasnip' } }, { { name = 'buffer' }, { name = 'path' } })
  })

  require('mason').setup()
  require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'pyright', 'gopls', 'ts_ls' },
    handlers = {
      function(server_name)
        require('lspconfig')[server_name].setup({
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })
      end,
    },
  })
  require('fidget').setup({})

  -- 5. Treesitter
  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'python', 'go', 'typescript', 'markdown' },
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = { init_selection = '<leader>v', node_incremental = '<leader>v', node_decremental = '<bs>' },
    },
  })

  -- 6. Formatting & Linting
  require('conform').setup({
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'isort', 'black' },
      go = { 'goimports', 'gofmt' },
    },
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
  })

  -- 7. Git
  require('gitsigns').setup()

  -- 8. UI & Others
  require('which-key').setup()
  require('todo-comments').setup()
  require('flash').setup()
  require('oil').setup({ default_file_explorer = true })
  require('aerial').setup()
  require('persistence').setup()
  require('harpoon').setup()
  require('transparent').setup()
  require('dressing').setup()
  require('trouble').setup()
  require('copilot').setup({
    suggestion = { enabled = true, auto_trigger = true, keymap = { accept = "<M-l>" } }
  })

  -- 9. Debugging & Testing
  require('dapui').setup()
  require('nvim-dap-virtual-text').setup()
  require('dap-python').setup('python3')
  require('dap-go').setup()
  
  require('neotest').setup({
    adapters = {
      require('neotest-python')({ dap = { adapter = 'debugpy' } }),
      require('neotest-go')({ args = { '-v' } }),
    }
  })

  -- 10. Markdown & Obsidian
  require('render-markdown').setup()
  require('obsidian').setup({
    workspaces = { { name = 'personal', path = '~/Obsidian_MD' } },
  })
end

return M

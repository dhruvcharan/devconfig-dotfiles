-- lua/plugins/treesitter.lua

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate', -- Automatically install/update parsers
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('nvim-treesitter.configs').setup({
        -- A list of parser names, or "all"
        ensure_installed = {
          'bash',
          'c',
          'cpp',
          'css',
          'go',
          'html',
          'javascript',
          'json',
          'lua',
          'markdown',
          'python',
          'rust',
          'toml',
          'typescript',
          'vim',
          'yaml',
        },

        -- Install parsers synchronously (only applied on startup)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        auto_install = true,

        highlight = {
          enable = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to true if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        
        indent = {
          enable = true,
        },

        -- Incremental selection: Expand/shrink selection based on code structure
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<leader>v', -- Start selecting
            node_incremental = '<leader>v', -- Expand selection
            scope_incremental = false,
            node_decremental = '<bs>', -- Shrink selection (Backspace)
          },
        },
      })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
  },
}

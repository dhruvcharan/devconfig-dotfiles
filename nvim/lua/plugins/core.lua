-- lua/plugins/core.lua

return {
  -- Which-key: a popup for keybindings
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section for more details
    },
  },

  -- Mini.nvim: A collection of small, fast, and feature-rich modules
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      -- Essential Text Editing Modules
      require('mini.ai').setup()
      require('mini.surround').setup()
      require('mini.pairs').setup()
      require('mini.comment').setup()
      require('mini.bufremove').setup()
      
      -- We removed mini.pick, mini.starter, mini.files in favor of snacks.nvim
    end,
  },

  -- Flash: Snappy code navigation
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
      { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
      { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
      { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
    },
  },

  -- Todo Comments: Highlight and search TODO/FIXME
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },

  -- Harpoon: Blazingly fast file navigation
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require('harpoon')
      harpoon:setup()

      -- Basic Telescope configuration (optional, but requested often)
      -- conf = require("telescope.config").values
      -- function(harpoon_files) ... end
    end,
    keys = {
      { "<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon Add File" },
      { "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon Menu" },
      { "<C-h>", function() require("harpoon"):list():select(1) end, desc = "Harpoon File 1" },
      { "<C-t>", function() require("harpoon"):list():select(2) end, desc = "Harpoon File 2" }, -- remapped from C-j/k/l due to window nav conflicts?
      { "<C-n>", function() require("harpoon"):list():select(3) end, desc = "Harpoon File 3" },
      { "<C-s>", function() require("harpoon"):list():select(4) end, desc = "Harpoon File 4" },
    },
  },

  -- Undotree: Visual undo history
  {
    'mbbill/undotree',
    keys = {
      { '<leader>u', vim.cmd.UndotreeToggle, desc = 'Toggle Undotree' },
    },
  },

  -- Snacks.nvim: Sensible default configurations
  {
    'folke/snacks.nvim',
    config = function()
      require('snacks').setup()
    end,
  },

  -- ## Themes ##

  -- Gruvbox (Default Theme)
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000, -- Ensure it loads first
    config = function()
      vim.cmd.colorscheme('gruvbox')
    end,
  },
  
  -- Other themes
  'folke/tokyonight.nvim',
  'catppuccin/nvim',
  'rose-pine/neovim',
  
}

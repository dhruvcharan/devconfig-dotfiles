return {
  "kawre/leetcode.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", 
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  build = function()
    vim.cmd([[TSInstall html]])
  end,
  config = function()
    require("leetcode").setup({
      -- Language configuration
      lang = "python3",
      -- Using your existing colorscheme
      colorscheme = "gruvbox",
      
      -- Configuration options
      arg = "leetcode.nvim",
      
      -- Browser for opening leetcode problems (optional)
      browser = "chrome",
      
      storage = {
        home = vim.fn.stdpath("data") .. "/leetcode",
        cache = vim.fn.stdpath("cache") .. "/leetcode",
      },
      
      -- Keymaps
      keymaps = {
        -- Basic operations
        toggle = { mode = "n", keys = "<leader>ct" },
        submit = { mode = "n", keys = "<leader>cs" },
        test = { mode = "n", keys = "<leader>cr" },
        
        -- Navigation
        prev_question = { mode = "n", keys = "[q" },
        next_question = { mode = "n", keys = "]q" },

        -- Problem selection
        random_question = { mode = "n", keys = "<leader>cx" },
        last_contest = { mode = "n", keys = "<leader>cC" },
        daily = { mode = "n", keys = "<leader>cy" },

        -- Menu actions
        reset_code = { mode = "n", keys = "<leader>cR" },
        lang_select = { mode = "n", keys = "<leader>cL" },
        timer_toggle = { mode = "n", keys = "<leader>cT" },
        hint = { mode = "n", keys = "<leader>ch" },
        notes = { mode = "n", keys = "<leader>cn" },
      },
    })
    
    local keymap = vim.keymap
    -- Existing keymaps
    keymap.set("n", "<leader>cc", "<cmd>Leet console<cr>", { desc = "Open Leetcode console" })
    keymap.set("n", "<leader>cl", "<cmd>Leet list<cr>", { desc = "Open Leetcode problem list" })
    keymap.set("n", "<leader>cd", "<cmd>Leet desc<cr>", { desc = "Open Leetcode problem description" })
    keymap.set("n", "<leader>cm", "<cmd>Leet menu<cr>", { desc = "Open Leetcode menu" })
    keymap.set("n", "<leader>ch", "<cmd>Leet hints<cr>", { desc = "Open Leetcode contest" })

    -- Additional keymaps for filtering problems
    keymap.set("n", "<leader>ce", "<cmd>Leet list easy<cr>", { desc = "List easy problems" })
    keymap.set("n", "<leader>cE", "<cmd>Leet list medium<cr>", { desc = "List medium problems" })
    keymap.set("n", "<leader>cH", "<cmd>Leet list hard<cr>", { desc = "List hard problems" })
    keymap.set("n", "<leader>cf", "<cmd>Leet list favorite<cr>", { desc = "List favorite problems" })
    keymap.set("n", "<leader>cd", "<cmd>Leet list done<cr>", { desc = "List completed problems" })
    keymap.set("n", "<leader>cu", "<cmd>Leet list undone<cr>", { desc = "List unsolved problems" })
  end,
}
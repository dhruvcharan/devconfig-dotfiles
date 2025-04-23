return {
  "epwalsh/obsidian.nvim",
  version = "*", 
  lazy = true,
  ft = "markdown",
  -- Replace this with your actual vault path
  -- e.g. "~/Documents/Obsidian Vault"
  event = {
    -- If you want to use obsidian.nvim only for some directories and not others
    -- "BufReadPre path/to/my-vault/**.md",
    -- "BufNewFile path/to/my-vault/**.md",
    
    -- Or just use it for all markdown files
    "BufReadPre *.md",
    "BufNewFile *.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "personal",
          path = "/Users/dhruvcharan/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main ideas vault",  -- Replace with your vault path
          -- Optional configuration for overrides:
          -- notes_subdir = "notes",
          -- overrides = {
          --   templates_subdir = "templates",
          --   daily_notes = {
          --     date_format = "%Y-%m-%d",
          --     folder = "dailies"
          --   }
          -- }
        },
        -- You can add additional workspaces here
        -- {
        --   name = "work",
        --   path = "~/Documents/Work-Notes",
        -- }
      },

     
      notes_subdir = "notes",
      daily_notes = {
        folder = "dailies",
        date_format = "%Y-%m-%d",
        template = nil,  -- Optional template
      },

     
      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
     
        substitutions = {
     
          yesterday = function()
            return os.date("%Y-%m-%d", os.time() - 86400)
          end,
        },
      },

     
      wiki_link_func = function(opts)
        if opts.label ~= opts.path then
          return string.format("[[%s|%s]]", opts.path, opts.label)
        else
          return string.format("[[%s]]", opts.path)
        end
      end,

     
      new_notes_location = "notes_subdir",
      completion = {
        nvim_cmp = true,  
        min_chars = 2,    
      },

      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        
        ["<leader>ot"] = {
          action = function()
            return require("obsidian").commands.new_tab()
          end,
          opts = { buffer = true },
        },
        
        ["<leader>of"] = {
          action = function()
            return require("obsidian").commands.find_notes()
          end,
          opts = { buffer = true },
        },
        
        ["<leader>os"] = {
          action = function()
            return require("obsidian").commands.search_vault()
          end,
          opts = { buffer = true },
        },
      },

      ui = {
        enable = true, 
      },
      
      finder = "telescope.nvim",  
    })

    vim.keymap.set("n", "<leader>on", ":ObsidianNew ", { desc = "Create new Obsidian note" })
    vim.keymap.set("n", "<leader>od", ":ObsidianToday<CR>", { desc = "Open today's daily note" })
    vim.keymap.set("n", "<leader>oy", ":ObsidianYesterday<CR>", { desc = "Open yesterday's daily note" })
    vim.keymap.set("n", "<leader>ot", ":ObsidianTomorrow<CR>", { desc = "Open tomorrow's daily note" })
    vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>", { desc = "Show note backlinks" })
    vim.keymap.set("n", "<leader>ol", ":ObsidianLinks<CR>", { desc = "Show note links" })
    vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>", { desc = "Open note in Obsidian" })
  end,
}
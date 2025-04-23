return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = { 
        enabled = true,
        sections = {
          { 
            section = "terminal",
            cmd = "chafa ~/.config/nvim/lua/dhruvcharan/plugins/images/melee_island.jpeg --format ansi --symbols block --dither ordered --size 60x17 --stretch ; sleep .1",
            height = 17,
            padding = 1,
          },
          {
            pane = 2,
            { section = "keys", gap = 1, padding = 1 },
            { section = "startup" },
          },
        }
      },
      explorer = { enabled = false }, 
      indent = { enabled = true },
      input = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      picker = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      styles = {
        notification = {
          
        }
      }
    },
    
    config = function(_, opts)
      
      require("snacks").setup(opts)
      
      
      _G.Snacks = require("snacks")
    end,
    
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          
          
          _G.dd = function(...)
            require("snacks").debug.inspect(...)
          end
          _G.bt = function()
            require("snacks").debug.backtrace()
          end
          vim.print = _G.dd 
          
          require("snacks").toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          require("snacks").toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          require("snacks").toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          require("snacks").toggle.diagnostics():map("<leader>ud")
          require("snacks").toggle.line_number():map("<leader>ul")
          require("snacks").toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
          require("snacks").toggle.treesitter():map("<leader>uT")
          require("snacks").toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
          require("snacks").toggle.inlay_hints():map("<leader>uh")
          require("snacks").toggle.indent():map("<leader>ug")
          require("snacks").toggle.dim():map("<leader>uD")
        end,
      })
      
      
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          
          if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
            
            vim.schedule(function()
              vim.notify("Welcome to Neovim", vim.log.levels.INFO)
              
            end)
          end
        end,
        group = vim.api.nvim_create_augroup("SnacksDashboard", { clear = true }),
      })
    end,
  }
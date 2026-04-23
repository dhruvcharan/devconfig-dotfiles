-- lua/plugins/ui.lua

return {
  -- Minimal Statusline
  {
    'echasnovski/mini.statusline',
    version = '*',
    config = function()
      local statusline = require('mini.statusline')
      statusline.setup({
        use_icons = true,
        set_vim_settings = false,
      })

      -- Customizing the statusline to include Copilot
      statusline.section_location = function()
        local copilot_status = ""
        if package.loaded["copilot"] then
          local client = vim.lsp.get_active_clients({ name = "copilot" })[1]
          if client then
            copilot_status = "  "
          end
        end
        return copilot_status .. "%2l:%-2v"
      end
    end,
  },

  -- Transparency
  {
    'xiyaowong/transparent.nvim',
    lazy = false,
    config = function()
      require('transparent').setup({
        extra_groups = {
          "NormalFloat",
          "NvimTreeNormal",
          "TelescopeNormal",
          "TelescopeBorder",
          "WhichKeyFloat",
        },
      })
    end,
  },

  -- Dressing: better UI for input/selection
  {
    'stevearc/dressing.nvim',
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require('dressing').setup()
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require('dressing').setup()
        return vim.ui.input(...)
      end
    end,
  },

  -- Trouble: Pretty list for diagnostics
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
    },
  },
}

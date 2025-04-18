return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- Replace deprecated key_labels with the new replace option
    replace = {
      ["<leader>"] = "SPC",
      ["<localleader>"] = "SPC",
      ["<cr>"] = "RET",
      ["<tab>"] = "TAB",
      ["<bs>"] = "BKSP",
    },
    -- Additional which-key configuration options
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and its label
      group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
      border = "rounded", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
  },
}

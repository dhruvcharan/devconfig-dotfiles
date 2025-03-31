return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    key_labels = {
      ["<leader>"] = "SPC",
      ["<localleader>"] = "SPC",
      ["<cr>"] = "RET",
      ["<tab>"] = "TAB",
      ["<bs>"] = "BKSP",
    },
  },
}

-- lua/dhruvcharan/plugins/undotree.lua
return {
    "mbbill/undotree",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
    },
    opts = {
      window = {
        width = 30,
        winblend = 0,
      },
    },
  }
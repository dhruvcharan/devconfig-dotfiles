return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  enabled = false,
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = function()
    require("nvim-surround").setup({
     
      keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S", 
        normal = "s", 
        normal_cur = "ss", 
        normal_line = "S", 
        normal_cur_line = "SS", 
        visual = "s", 
        visual_line = "S", 
        delete = "ds", 
        change = "cs", 
      },
    })
  end,
}

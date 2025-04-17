return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup({
      detection_methods = { "lsp", "pattern" },
      
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml" },
      
      show_hidden = false,
      
      datapath = vim.fn.stdpath("data"),
      
      
      telescope = {
        order_by = "recent",
        base_dirs = {
          { path = "~/Dev", max_depth = 4 },
          { path = "~/Projects", max_depth = 4 }, 
          { path = "~/.config", max_depth = 2 },
        },
        hidden_files = false, 
      }
    })
    
    
    require('telescope').load_extension('projects')
  end,
  dependencies = { "nvim-telescope/telescope.nvim" }
}
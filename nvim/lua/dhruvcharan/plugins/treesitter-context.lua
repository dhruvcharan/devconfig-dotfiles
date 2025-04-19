return {
  "nvim-treesitter/nvim-treesitter-context",
  config = function()
    require("treesitter-context").setup{
      -- Example appearance settings:
      enable = true,
      max_lines = 3, -- How many lines the context window can span
      trim_scope = "outer", -- "inner" or "outer"
      mode = "cursor", -- Line used to calculate context
      separator = "─", -- Separator between context and content
      zindex = 20, -- The Z-index of the context window
      on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    }

    -- Change the highlight group for the context window
    vim.cmd [[
      highlight! link TreesitterContext Normal
      highlight! link TreesitterContextLineNumber LineNr
    ]]
  end
}
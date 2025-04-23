return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    {
      "L3MON4D3/LuaSnip", -- snippet engine
      version = "v2.*",
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
    "MunifTanjim/nui.nvim", -- UI component library for Neovim
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local nui_popup = require("nui.popup")

    -- load friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_snipmate").lazy_load()
    require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets" })

    -- Setup nice snippet preview window with nui.nvim
    local snippet_popup = nui_popup({
      enter = false,
      focusable = false,
      border = {
        style = "rounded",
      },
      position = {
        row = 3,
        col = "50%",
      },
      size = {
        width = "60%",
        height = "30%",
      },
      buf_options = {
        modifiable = false,
        readonly = true,
      },
    })

    -- Function to display snippet documentation in the popup
    local function show_snippet_doc(entry, details)
      if not entry or not entry.source or entry.source.name ~= "luasnip" then
        snippet_popup:unmount()
        return
      end

      local content = ""
      if entry.completion_item and entry.completion_item.documentation then
        content = entry.completion_item.documentation or ""
      end

      if content == "" then
        snippet_popup:unmount()
        return
      end

      vim.api.nvim_buf_set_lines(snippet_popup.bufnr, 0, -1, false, vim.split(content, "\n"))
      snippet_popup:mount()
    end

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered({
          border = "rounded",
          winhighlight = "Normal:CmpNormal",
        }),
        documentation = cmp.config.window.bordered({
          border = "rounded",
          winhighlight = "Normal:CmpDocNormal",
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lua" },
      }),
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
          show_labelDetails = true, -- Show detailed label information
        }),
      },
      experimental = {
        ghost_text = true, -- Show ghost text while typing
      },
      -- Enable snippet preview with nui.nvim
      view = {
        entries = { name = "custom", selection_order = "near_cursor" },
      },
      -- Hook into events to show/hide snippet documentation
      event = {
        on_confirm_done = function()
          snippet_popup:unmount()
        end,
      },
    })

    -- Register event for showing snippet documentation
    cmp.event:on("menu_opened", function()
      vim.defer_fn(function()
        local entry = cmp.get_selected_entry()
        if entry and entry.source.name == "luasnip" then
          show_snippet_doc(entry)
        end
      end, 50)
    end)

    cmp.event:on("menu_closed", function()
      snippet_popup:unmount()
    end)

    cmp.event:on("confirm_done", function()
      snippet_popup:unmount()
    end)

    -- Update documentation when selection changes
    cmp.event:on("highlight_changed", function()
      local entry = cmp.get_selected_entry()
      show_snippet_doc(entry)
    end)
  end,
}

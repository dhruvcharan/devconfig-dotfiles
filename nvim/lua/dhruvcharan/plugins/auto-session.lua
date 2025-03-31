return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      log_level = "error",
      auto_session_enable_last_session = true, -- automatically load last session
      auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
      auto_session_enabled = true,
      auto_save_enabled = true,
      auto_restore_enabled = true, -- enable automatic session restoration
      auto_session_use_git_branch = true, -- different sessions per git branch
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
      
      -- Custom hooks to ensure clean session saving/loading
      pre_save_cmds = {
        "tabdo NvimTreeClose", -- close file trees before saving
        function()
          -- Close all terminal buffers before saving session
          for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
            local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")
            if buftype == "terminal" then
              vim.api.nvim_buf_delete(bufnr, { force = true })
            end
          end
          
          -- Stop LSP clients before quitting
          vim.lsp.stop_client(vim.lsp.get_active_clients())
        end
      },
      post_restore_cmds = {}, -- commands to run after restoring
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
    
    vim.api.nvim_create_user_command("SessionDelete", function()
      auto_session.DeleteSession()
    end, {})
    
    keymap.set("n", "<leader>wd", "<cmd>SessionDelete<CR>", { desc = "Delete current session" })
    
    -- Create a custom quitting command that handles jobs properly
    vim.api.nvim_create_user_command("XA", function()
      -- Check for unsaved buffers
      local has_unsaved = false
      for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].modified then
          has_unsaved = true
          break
        end
      end

      if has_unsaved then
        local choice = vim.fn.confirm("There are unsaved changes. Save all and quit?", "&Yes\n&No\n&Cancel", 1)
        if choice == 1 then
          -- Yes: Save all and continue with exit
          vim.cmd("wall")
        elseif choice == 2 then
          -- No: Continue without saving
        else
          -- Cancel: Abort exit
          return
        end
      end

      -- Close all terminal buffers
      for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")
        if buftype == "terminal" then
          vim.api.nvim_buf_delete(bufnr, { force = true })
        end
      end
      
      -- Stop all LSP clients
      vim.lsp.stop_client(vim.lsp.get_active_clients())
      
      -- Save and quit
      vim.cmd("xa")
    end, {})
    
    -- Optional: Create a keymap for the clean exit command
    keymap.set("n", "<leader>qa", "<cmd>XA<CR>", { desc = "Save all and quit (clean exit)" })
  end,
}

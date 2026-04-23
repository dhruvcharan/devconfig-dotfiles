
-- lua/plugins/dap.lua

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "mfussenegger/nvim-dap-python",
      "leoluz/nvim-dap-go",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      require("nvim-dap-virtual-text").setup()

      -- Python setup
      require("dap-python").setup("python3")
      
      -- Go setup
      require("dap-go").setup()

      -- Automatically open UI when debugging starts
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Customize icons
      vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='', numhl='' })
      vim.fn.sign_define('DapBreakpointCondition', { text='', texthl='DapBreakpointCondition', linehl='', numhl='' })
      vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='', numhl='' })
      vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='Visual', numhl='' })
      vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpointRejected', linehl='', numhl='' })
    end,
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue (Start Debugging)" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>do", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dO", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dr", function() require("dap").repl.open() end, desc = "Open REPL" },
      { "<leader>dt", function() require("dapui").toggle() end, desc = "Toggle Debug UI" },
      { "<leader>de", function() require("dapui").eval() end, desc = "Evaluate Expression" },
    },
  },
}

return {
  -- Define the plugin configuration for `nvim-dap`
  {
    -- Main plugin for debugging support
    "mfussenegger/nvim-dap",
    
    -- Define additional dependencies for extended functionality
    dependencies = {
      "rcarriga/nvim-dap-ui",     -- User interface for `nvim-dap`
      "nvim-neotest/nvim-nio",    -- NIO library, required by `nvim-dap-ui`
      "leoluz/nvim-dap-go",       -- Debug adapter for Go language
      "mfussenegger/nvim-dap-python"  -- Debug adapter for Python language
    },

    -- Configuration function for `nvim-dap`
    config = function()
      -- Load required modules
      local dap = require("dap")
      local dapui = require("dapui")

      -- Setup debugging adapters for Go and Python
      require("dap-go").setup()       -- Setup for Go debugging
      require("dap-python").setup()   -- Setup for Python debugging

      -- Configure `dapui` to open and close appropriately
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()  -- Open dapui when a debug session is attached
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()  -- Open dapui when a debug session is launched
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()  -- Close dapui when a debug session is terminated
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()  -- Close dapui when a debug session exits
      end

      -- Define key mappings for debugging actions
      -- Map <Leader>db to toggle a breakpoint
      vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, {})
      
      -- Map <Leader>dc to continue execution
      vim.keymap.set('n', '<Leader>dc', dap.continue, {})
    end
  },
}


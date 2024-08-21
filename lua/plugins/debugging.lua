return {
  -- Define the plugin configuration for `nvim-dap`
  {
    -- Main plugin for debugging support in Neovim.
    "mfussenegger/nvim-dap",
    
    -- Define additional dependencies for extended functionality:
    dependencies = {
      "rcarriga/nvim-dap-ui",     -- Provides a user interface for `nvim-dap`, making debugging more user-friendly.
      "nvim-neotest/nvim-nio",    -- NIO library required by `nvim-dap-ui` for asynchronous operations.
      "leoluz/nvim-dap-go",       -- Debug adapter specifically for the Go programming language.
      "mfussenegger/nvim-dap-python"  -- Debug adapter for the Python programming language.
    },

    -- Configuration function for `nvim-dap`
    config = function()
      -- Load required modules for DAP (Debug Adapter Protocol) functionality.
      local dap = require("dap")
      local dapui = require("dapui")
      
      -- Setup the DAP UI to initialize the user interface elements.
      dapui.setup()

      -- Setup debugging adapters for specific languages:
      require("dap-go").setup()       -- Configures debugging support for Go.
      require("dap-python").setup("python")   -- Configures debugging support for Python.

      -- Automatically open the DAP UI when debugging starts:
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      
      -- Open the DAP UI before launching a new debug session.
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      
      -- Automatically close the DAP UI when the debugging session ends (terminated).
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      
      -- Automatically close the DAP UI when the debugging session exits normally.
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- Define key mappings for common debugging actions:
      -- Map <Leader>db to toggle a breakpoint at the current line.
      vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, {})
      
      -- Map <Leader>dc to continue execution until the next breakpoint.
      vim.keymap.set('n', '<Leader>dc', dap.continue, {})

      -- Map <Leader>ds to step over the current line (execute without stepping into functions).
      vim.keymap.set('n', '<Leader>ds', dap.step_over, {})
      
      -- Map <Leader>di to step into the function under the cursor.
      vim.keymap.set('n', '<Leader>di', dap.step_into, {})
      
      -- Map <Leader>do to step out of the current function (return to the calling function).
      vim.keymap.set('n', '<Leader>do', dap.step_out, {})
    end
  },
}

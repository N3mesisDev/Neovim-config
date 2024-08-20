return {
  -- Plugin for adding a UI select extension to Telescope
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },

  -- Main Telescope plugin for fuzzy finding and searching
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',  -- Use a specific version tag for stability
    dependencies = { 'nvim-lua/plenary.nvim' },  -- Dependency for utility functions used by Telescope

    config = function()
      -- Setup Telescope with custom configuration
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {  -- Configure the `ui-select` extension
            require("telescope.themes").get_dropdown {  -- Use a dropdown theme for the select extension
            }
          }
        }
      }

      -- Load the `ui-select` extension
      require("telescope").load_extension("ui-select")

      -- Load the `builtin` functions from Telescope
      local builtin = require("telescope.builtin")

      -- Key mappings for Telescope functionalities
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})  -- Find files with `<leader>ff`
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})   -- Live grep with `<leader>fg`
    end
  },
}


return {
  -- Plugin declaration for the Tokyo Night color scheme
  "folke/tokyonight.nvim",
  
  -- Ensure the plugin is not lazy-loaded
  lazy = false,
  
  -- Set the loading priority to ensure this theme is loaded before others
  priority = 1000,
  
  -- Options for configuring the plugin (currently empty)
  opts = {},

  -- Configuration function to set up the color scheme
  config = function()
    -- Apply the Tokyo Night color scheme
    vim.cmd.colorscheme "tokyonight"
  end
}


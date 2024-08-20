return {
  -- Plugin declaration for Treesitter
  "nvim-treesitter/nvim-treesitter",
  
  -- Command to update Treesitter parsers automatically
  built = ":TSUpdate",

  -- Configuration function to set up Treesitter
  config = function()
    -- Load the Treesitter configuration module
    local ts_config = require("nvim-treesitter.configs")

    -- Setup Treesitter with desired options
    ts_config.setup({
      -- Automatically install missing parsers when opening files
      auto_install = true,
      
      -- Enable syntax highlighting using Treesitter
      highlight = { enable = true },
      
      -- Enable automatic indentation based on Treesitter parsing
      indent = { enable = true },
    })
  end
}


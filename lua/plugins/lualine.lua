return {
  -- Plugin for a status line at the bottom of the Neovim window
  'nvim-lualine/lualine.nvim',
  
  -- Declare dependencies for `lualine.nvim`
  dependencies = { 
    'nvim-tree/nvim-web-devicons' -- Provides file type icons for `lualine`
  },
  
  -- Configuration function for `lualine.nvim`
  config = function()
    -- Load the lualine module
    local lualine = require("lualine")

    -- Setup `lualine` with custom options
    lualine.setup({
      options = {
        -- Enable or disable icons in the status line
        icons_enable = true,
        
        -- Set the theme for the status line
        theme = 'dracula',  -- This sets the theme to 'dracula'. Make sure this theme is available or change it to a different supported theme.
      },
    })
  end
}


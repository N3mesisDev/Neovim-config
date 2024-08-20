return {
  {
    -- Main plugin for file navigation and other functionalities
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",  -- Use the version 3.x branch of the plugin for stability

    -- Dependencies required by `neo-tree.nvim`
    dependencies = {
      "nvim-lua/plenary.nvim",  -- A collection of Lua functions used by many Neovim plugins
      "nvim-tree/nvim-web-devicons",  -- Provides icons for file types and other elements (recommended but not strictly required)
      "MunifTanjim/nui.nvim",  -- A UI component library for building Neovim user interfaces
      -- "3rd/image.nvim",  -- Optional dependency for image support in the preview window (uncomment if you need this feature)
    },

    -- Configuration function for `neo-tree.nvim`
    config = function()
      -- Map <C-n> to toggle the Neo-tree file explorer
      vim.keymap.set("n", "<C-n>", ":Neotree source=filesystem reveal=true position=left<CR>", {})
    end
  },
}


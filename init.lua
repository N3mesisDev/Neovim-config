-- Bootstrap lazy.nvim
-- This script ensures that the `lazy.nvim` plugin manager is installed and configured for Neovim.

-- Define the path where `lazy.nvim` should be installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if `lazy.nvim` is already installed by checking the file system status
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- URL of the `lazy.nvim` repository to clone
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  
  -- Clone the repository into the specified path with the stable branch and without unnecessary blobs
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  
  -- Check if the cloning operation was successful
  if vim.v.shell_error ~= 0 then
    -- If cloning failed, display an error message to the user
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },  -- Error message header
      { out, "WarningMsg" },  -- Output of the failed cloning operation
      { "\nPress any key to exit..." },  -- Prompt for the user to exit
    }, true, {})
    
    -- Wait for user input
    vim.fn.getchar()
    
    -- Exit the script with an error status
    os.exit(1)
  end
end

-- Prepend the `lazy.nvim` path to Neovim's runtime path
vim.opt.rtp:prepend(lazypath)

-- Load additional configuration files and plugins
-- Require user-defined keymaps and options configurations
require("vim-keymaps")
require("vim-options")

-- Set up `lazy.nvim` with the plugins directory
require("lazy").setup("plugins")


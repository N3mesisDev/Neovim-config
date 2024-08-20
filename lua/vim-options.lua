-- Set options for Vim using Lua's `vim.cmd` function

-- Enable expandtab to convert tabs to spaces
vim.cmd("set expandtab")

-- Set the number of spaces that a tab character represents
vim.cmd("set tabstop=2")

-- Set the number of spaces that should be used for each step of (soft) tabbing
vim.cmd("set softtabstop=2")

-- Set the number of spaces to use for each indentation level
vim.cmd("set shiftwidth=2")

-- Show line numbers in the editor
vim.cmd("set number")

-- Show relative line numbers, with the current line being displayed as `0`
vim.cmd("set relativenumber")

-- Set the leader key to space. This is used to prefix custom mappings
vim.g.mapleader = " "

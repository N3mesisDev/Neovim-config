-- Copying to system clipboard
-- From current cursor position to EOL (normal mode)
vim.keymap.set({'n'}, '<C-c>', '"+y$') -- Ctrl + c
-- Current selection (visual mode)
vim.keymap.set({'v'}, '<C-c>', '"+y')  -- Ctrl + c

-- Pasting to system clipboard
-- From current cursor position (normal mode)
vim.keymap.set({'n'}, '<C-v>', '"+p') -- Ctrl + v
-- Current selection (visual mode)
vim.keymap.set({'v'}, '<C-v>', '"+p') -- Ctrl + v

-- Cutting to system clipboard
-- From current cursor position to EOL (normal mode)
vim.keymap.set({'n'}, '<C-x>', '"+d$') -- Ctrl + x
-- Current selection (visual mode)
vim.keymap.set({'v'}, '<C-x>', '"+d') -- Ctrl + x 

-- Undo operation
vim.keymap.set('n', '<C-z>', 'u') -- Ctrl + z

-- Redo operation
vim.keymap.set('n', '<C-y>', '<C-r>') -- Ctrl + y

-- Save files
vim.keymap.set('n', '<C-s>', ':wa<CR>') -- Ctrl + s


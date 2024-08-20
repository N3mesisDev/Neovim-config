return {
  -- Plugin for integrating external tools with Neovim's built-in LSP
  "nvimtools/none-ls.nvim",

  config = function ()
    -- Load the `null-ls` module
    local null_ls = require("null-ls")

    -- Setup `null-ls` with desired sources for formatting and diagnostics
    null_ls.setup({
      sources = {
        -- Add source for Lua formatting
        null_ls.builtins.formatting.stylua,
        
        -- Add source for various formatting tools (e.g., Prettier for web development)
        null_ls.builtins.formatting.prettier,
        
        -- Add source for Ruby diagnostics
        null_ls.builtins.diagnostics.erb_lint,
        null_ls.builtins.diagnostics.rubocop,
        
        -- Add source for Ruby formatting
        null_ls.builtins.formatting.rubocop,
      },
    })

    -- Define key mapping to format the current buffer using LSP format functionality
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end
}


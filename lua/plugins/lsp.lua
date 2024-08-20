return {
  -- Plugin for managing LSP servers, linters, and formatters
  {
    "williamboman/mason.nvim",
    lazy = false,  -- Load this plugin immediately when Neovim starts

    config = function()
      -- Setup Mason, which handles the installation and management of LSP servers
      require("mason").setup()
    end
  },
  -- Plugin for integrating Mason with `nvim-lspconfig`
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,  -- Load this plugin immediately when Neovim starts
    opts = {
      auto_install = true,  -- Automatically install LSP servers defined in `ensure_installed`
    },
  },
  -- Core plugin for configuring built-in LSP support
  {
    "neovim/nvim-lspconfig",
    lazy = false,  -- Load this plugin immediately when Neovim starts

    config = function()
      -- Setup Mason-LSPConfig to manage LSP servers
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",      -- Lua language server
          "tsserver",    -- TypeScript language server
          "html",        -- HTML language server
          "pylsp",       -- Python language server
          "pyright",     -- Alternative Python language server
          "tailwindcss", -- Tailwind CSS language server
          "unocss",      -- UnoCSS language server
          "jdtls",       -- Java language server
        },
      })

      -- Load `lspconfig` for configuring LSP servers
      local lspconfig = require("lspconfig")

      -- Setup each LSP server
      lspconfig.lua_ls.setup({})       -- Configure Lua language server
      lspconfig.tsserver.setup({})     -- Configure TypeScript server
      lspconfig.html.setup({})         -- Configure HTML server
      lspconfig.pylsp.setup({})        -- Configure Python server

      -- Key mappings for LSP functions
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})          -- Show hover information
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {}) -- Go to definition
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {}) -- Find references
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {}) -- Show code actions
    end
  },
}


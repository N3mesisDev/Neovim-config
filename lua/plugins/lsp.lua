return {
  -- Plugin for managing LSP servers, linters, and formatters
  {
    "williamboman/mason.nvim",
    lazy = false,  -- Load this plugin immediately when Neovim starts

    config = function()
      -- Setup Mason, which handles the installation and management of LSP servers.
      -- This function initializes Mason with its default settings.
      require("mason").setup()
    end
  },
  
  -- Plugin for integrating Mason with `nvim-lspconfig`.
  -- This plugin connects Mason to the built-in LSP configuration tool `nvim-lspconfig`.
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,  -- Load this plugin immediately when Neovim starts

    opts = {
      auto_install = true,  -- Automatically install LSP servers that are listed in `ensure_installed`.
    },
  },
  
  -- Core plugin for configuring built-in LSP (Language Server Protocol) support.
  -- This plugin provides easy configurations for various language servers.
  {
    "neovim/nvim-lspconfig",
    lazy = false,  -- Load this plugin immediately when Neovim starts

    config = function()
      -- Capabilities object is used to advertise the features supported by nvim-cmp to LSP servers.
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Setup Mason-LSPConfig to manage the installation and configuration of LSP servers.
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

      -- Load `lspconfig` module, which is used to configure LSP servers.
      local lspconfig = require("lspconfig")

      -- Setup each LSP server with the necessary configurations, including capabilities.
      lspconfig.lua_ls.setup({ capabilities = capabilities })       -- Configure Lua language server
      lspconfig.tsserver.setup({ capabilities = capabilities })     -- Configure TypeScript language server
      lspconfig.html.setup({ capabilities = capabilities })         -- Configure HTML language server
      lspconfig.pylsp.setup({ capabilities = capabilities })        -- Configure Python language server
      lspconfig.pyright.setup({ capabilities = capabilities })      -- Configure alternative Python language server
      lspconfig.tailwindcss.setup({ capabilities = capabilities })  -- Configure Tailwind CSS language server
      lspconfig.unocss.setup({ capabilities = capabilities })       -- Configure UnoCSS language server
      lspconfig.jdtls.setup({ capabilities = capabilities })        -- Configure Java language server

      -- Define key mappings for various LSP functions:
      -- K: Show hover information about the symbol under the cursor.
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

      -- <leader>gd: Go to the definition of the symbol under the cursor.
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})

      -- <leader>gr: List references to the symbol under the cursor.
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})

      -- <leader>ca: Show available code actions for the current line or selection.
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end
  },
}

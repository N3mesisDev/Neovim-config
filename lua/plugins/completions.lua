return {
  -- Define a list of plugins to be loaded
  {
    -- Plugin for LSP (Language Server Protocol) completion
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    -- Plugin for LuaSnip, a snippet engine
    "L3MON4D3/LuaSnip",
    dependencies = {
      -- Additional plugins required for LuaSnip
      "saadparwaiz1/cmp_luasnip",  -- Integration with nvim-cmp for LuaSnip
      "rafamadriz/friendly-snippets",  -- Collection of predefined snippets
    },
  },
  {
    -- Core completion plugin
    "hrsh7th/nvim-cmp",
    config = function()
      -- Load required LuaSnip extensions
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Setup nvim-cmp with various options
      cmp.setup({
        -- Configuration for snippets
        snippet = {
          expand = function(args)
            -- Expand snippets using LuaSnip
            require("luasnip").lsp_expand(args.body)
          end,
        },
        -- Configuration for completion and documentation windows
        window = {
          completion = cmp.config.window.bordered(),  -- Use bordered window for completion
          documentation = cmp.config.window.bordered(),  -- Use bordered window for documentation
        },
        -- Key mappings for completion
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),  -- Scroll documentation up
          ["<C-f>"] = cmp.mapping.scroll_docs(4),   -- Scroll documentation down
          ["<C-Space>"] = cmp.mapping.complete(),    -- Trigger completion
          ["<C-e>"] = cmp.mapping.abort(),           -- Abort completion
          ["<CR>"] = cmp.mapping.confirm({ select = true }),  -- Confirm completion selection
        }),
        -- Sources for completion
        sources = cmp.config.sources({
          { name = "nvim_lsp" },  -- Completion from LSP
          { name = "luasnip" },   -- Completion from LuaSnip
        }, {
          { name = "buffer" },    -- Completion from current buffer
        }),
      })
    end,
  },
}


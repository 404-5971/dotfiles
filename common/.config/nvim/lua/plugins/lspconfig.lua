return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.diagnostic.config({
      virtual_text = true, -- Show text next to the error
      signs = true, -- Show icons in the sidebar
      underline = true, -- Underline the error
      update_in_insert = false, -- Don't yell at me while I'm still typing
      severity_sort = true, -- Show errors before warnings
    })

    -- 2. Define Custom Icons (requires a Nerd Font)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup({
      -- This 'handlers' table replaces the old 'setup_handlers' function
      handlers = {
        -- 1. Default Handler (runs for every server not specified below)
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,

        -- 2. Specific Override for Pyright
        ["pyright"] = function()
          require("lspconfig").pyright.setup({
            capabilities = capabilities,
            settings = {
              python = {
                analysis = {
                  typeCheckingMode = "off",
                  autoSearchPaths = true,
                  useLibraryCodeForTypes = true,
                },
              },
            },
          })
        end,

        ["rust_analyzer"] = function()
          require("lspconfig").rust_analyzer.setup({
            capabilities = capabilities,
            settings = {
              ["rust-analyzer"] = {
                checkOnSave = {
                  command = "clippy", -- Use clippy for better linting!
                },
                diagnostics = {
                  enable = true,
                },
              },
            },
          })
        end,
      },
    })
  end,
}

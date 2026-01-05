return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      -- Define which tools to use for which file types
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black", "isort" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        bash = { "beautysh" }, -- or "shfmt"
        rust = { "rustfmt", lsp_fallback = true }, -- Add this!
      },
      formatters = {
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
      },
      -- Enable Format on Save
      format_on_save = {
        lsp_fallback = true, -- If no formatter is found, use the LSP (e.g. clangd)
        async = false, -- Wait for formatting to finish before saving
        timeout_ms = 1000, -- Kill it if it takes too long
      },
    })
  end,
}

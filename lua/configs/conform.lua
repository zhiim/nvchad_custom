local options = {
  formatters_by_ft = {
    -- use `:lua print(vim.bo.filetype)` to check filetype
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    python = { "isort" },
    c = { "clang-format" },
    cpp = { "clang-format" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

require("conform").setup(options)

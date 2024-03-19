local lint = require('lint')
local linterConfig = vim.fn.stdpath("config") .. "/linter_configs"

lint.linters_by_ft = {
  python = { "ruff" },
}

vim.keymap.set("n", "<leader>lt", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })

-- set config file for ruff
-- args can not be merged, so original setting should be copied
lint.linters.ruff.args = {
    "--force-exclude",
    "--quiet",
    "--stdin-filename",
    vim.api.nvim_buf_get_name(0),
    "--no-fix",
    "--output-format",
    "json",
    "--config",
    linterConfig .. "/ruff.toml",
    "-",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        lint.try_lint()
    end,
})

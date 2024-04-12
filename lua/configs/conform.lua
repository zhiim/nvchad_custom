local conform = require("conform")
local formatterConfig = vim.fn.stdpath("config") .. "/formatter_configs"

local options = {
	formatters_by_ft = {
		-- use `:lua print(vim.bo.filetype)` to check filetype
		lua = { "stylua" },
		css = { "prettier" },
		html = { "prettier" },
		markdown = { "prettier" },
		json = { "prettier" },
		python = { "ruff_fix", "ruff_format" },
		c = { "clang_format" },
		cpp = { "clang_format" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
}

conform.setup(options)

conform.formatters.ruff_fix = {
	args = {
		"check",
		"--fix",
		"--force-exclude",
		"--exit-zero",
		"--no-cache",
		"--config",
		formatterConfig .. "/ruff.toml",
		"--stdin-filename",
		"$FILENAME",
		"-",
	},
}

conform.formatters.ruff_format = {
	args = {
		"format",
		"--config",
		formatterConfig .. "/ruff.toml",
		"--stdin-filename",
		"$FILENAME",
		"-",
	},
}

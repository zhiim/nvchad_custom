return {
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre' -- uncomment for format on save
		config = function()
			require("configs.conform")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	{
		"mfussenegger/nvim-lint",
		-- loading this plugin depends on event
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			require("configs.lint")
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				-- lua
				"lua-language-server",
				"stylua",
				-- c/cpp stuff
				"clangd",
				"clang-format",
				-- "codelldb",  -- c/c++ debugger
				"cmake-language-server",
				-- python stuff
				"python-lsp-server", -- lsp
				-- "pyright",
				"ruff", -- linter with lots of syntex check
				-- "debugpy", -- used with dap-python
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"c",
				"markdown",
				"markdown_inline",
				"cpp",
				"python",
			},
		},
	},

	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	-- DAP plugin
	-- {
	--   "mfussenegger/nvim-dap",
	--   config = function()
	--       require("configs.dapconfig")
	--   end
	-- },
	-- {
	--   "rcarriga/nvim-dap-ui",
	--   -- load this plugin by key mappings
	--   dependencies = {
	--     -- loading nvim-dap when loaded
	--     "mfussenegger/nvim-dap",
	--   },
	--   config = function()
	--       require("dapui").setup()
	--   end,
	-- },
	--
	-- {
	--   "mfussenegger/nvim-dap-python",
	--   dependencies = {
	--     -- loading nvim-dap and nvim-dap-ui when loaded
	--     "mfussenegger/nvim-dap",
	--     "rcarriga/nvim-dap-ui",
	--   },
	--   ft = "python",
	-- },
	--
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
		keys = { "<leader>ga" },
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	},

	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
}

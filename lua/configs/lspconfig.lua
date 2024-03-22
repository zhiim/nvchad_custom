-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { "cmake" }

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	})
end

local function get_gcc_path()
	local handle = io.popen("where c++")
	if handle == nil then
		print("get gcc path failed")
	else
		local result = handle:read("*a")
		handle:close()
		return result
	end
end

local gcc_path = get_gcc_path()

-- clangd setting, use mingw in windows
local is_windows = vim.fn.has("win32") ~= 0
local clangd_mingw
if is_windows then
	clangd_mingw = "--query-driver=" .. gcc_path
	lspconfig.clangd.setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
		cmd = {
			"clangd",
			clangd_mingw,
		},
	})
else
	-- if in linux
	lspconfig.clangd.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

--
-- lspconfig.pyright.setup { blabla}

-- pylsp settings
lspconfig.pylsp.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					enabled = false,
				},
			},
		},
	},
})

local MiniMap = require("mini.map")

local encode_symbol

local is_windows = vim.fn.has("win32") ~= 0
if is_windows then
	-- block do not work with Windows Ternimal
	encode_symbol = MiniMap.gen_encode_symbols.dot()
else
	-- dot do not work with Konsole
	encode_symbol = MiniMap.gen_encode_symbols.block()
end

local options = {
	integrations = {
		MiniMap.gen_integration.builtin_search(),
		MiniMap.gen_integration.gitsigns(),
		MiniMap.gen_integration.diagnostic(),
	},
	symbols = {
		encode = encode_symbol,
	},
}

MiniMap.setup(options)

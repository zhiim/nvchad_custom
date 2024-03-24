local MiniMap = require("mini.map")

local options

local is_windows = vim.fn.has("win32") ~= 0
if is_windows then
	-- block do not work with Windows Ternimal
	options = {
		integrations = {
			MiniMap.gen_integration.builtin_search(),
			MiniMap.gen_integration.gitsigns(),
			MiniMap.gen_integration.diagnostic(),
		},
		symbols = {
			encode = MiniMap.gen_encode_symbols.dot("4x2"),
		},
	}
else
	-- dot do not work with Konsole
	options = {
		integrations = {
			MiniMap.gen_integration.builtin_search(),
			MiniMap.gen_integration.gitsigns(),
			MiniMap.gen_integration.diagnostic(),
		},
		symbols = {
			encode = MiniMap.gen_encode_symbols.block(),
		},
	}
end

MiniMap.setup(options)

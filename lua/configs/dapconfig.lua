local dap = require("dap")
local dapui = require("dapui")

-- dap-ui configurations
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

local is_windows = vim.fn.has("win32") ~= 0
-- c/c++ debugger
local lldb_path, detached_status
if is_windows then
	lldb_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb.exe"
	detached_status = false
else
	lldb_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb"
	detached_status = true
end
dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		-- CHANGE THIS to your path!
		command = lldb_path,
		args = { "--port", "${port}" },

		-- On windows you may have to uncomment this:
		detached = detached_status,
	},
}

-- c/c++ debugger configurations
dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = function()
			local argument_string = vim.fn.input("Program arguments: ")
			return vim.fn.split(argument_string, " ", true)
		end,
	},
}
dap.configurations.c = dap.configurations.cpp

-- python debugger
local debugpy_path
if is_windows then
	debugpy_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/debugpy/venv/bin/python.exe"
else
	debugpy_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/debugpy/venv/bin/python"
end

require("dap-python").setup(debugpy_path)

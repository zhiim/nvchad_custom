local dap = require('dap')
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

-- c/c++ debugger
local lldb_path, detached_status
if vim.loop.os_uname().sysname == "Windows_NT" then
    lldb_path = os.getenv("UserProfile") .. "\\AppData\\Local\\nvim-data\\mason\\packages\\codelldb\\extension\\adapter\\codelldb.exe"
    detached_status = false
else
    lldb_path = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb"
    detached_status = true
end
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = lldb_path,
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    detached = detached_status,
  }
}

-- c/c++ debugger configurations
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
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
if vim.loop.os_uname().sysname == "Windows_NT" then
    debugpy_path = os.getenv("UserProfile") .. '\\AppData\\Local\\nvim-data\\mason\\packages\\debugpy\\venv\\Scripts\\python.exe'
else
    debugpy_path = os.getenv("HOME") .. '/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
end

require("dap-python").setup(debugpy_path)

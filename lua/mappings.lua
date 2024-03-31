require("nvchad.mappings")

-- Disable mappings
local nomap = vim.keymap.del

-- diable default mappings of toggleable terminal
nomap({ "n", "t" }, "<A-v>")
nomap({ "n", "t" }, "<A-h>")
nomap({ "n", "t" }, "<A-i>")
nomap("n", "<leader>h")
nomap("n", "<leader>v")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- mappings for terminal
map("n", "<leader>v", function()
	require("nvchad.term").toggle({ pos = "vsp", id = "vtoggleTerm", size = 0.3 })
end, { desc = "Terminal Toggleable vertical term in normal mode" })

map("n", "<leader>h", function()
	require("nvchad.term").toggle({ pos = "sp", id = "htoggleTerm", size = 0.3 })
end, { desc = "Terminal New horizontal term in terminal mode" })

map("n", "<leader>i", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "Terminal Togglable Floating term in normal mode" })

map("t", "<A-x>", function()
	local win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_close(win, true)
end, { desc = "Terminal Close term in terminal mode" })

-- key mappings for neogen plugin
map("n", "<leader>gen", function()
	require("neogen").generate()
end, { desc = "Genearte annotation template" })

-- key mappings for smart-split.nvim
map("n", "<C-h>", function()
	require("smart-splits").move_cursor_left()
end, { desc = "Move Left" })
map("n", "<C-l>", function()
	require("smart-splits").move_cursor_right()
end, { desc = "Move Right" })
map("n", "<C-j>", function()
	require("smart-splits").move_cursor_down()
end, { desc = "Move Down" })
map("n", "<C-k>", function()
	require("smart-splits").move_cursor_up()
end, { desc = "Move Up" })
map("n", "<A-h>", function()
	require("smart-splits").resize_left()
end, { desc = "Resize Left" })
map("n", "<A-l>", function()
	require("smart-splits").resize_right()
end, { desc = "Resize Right" })
map("n", "<A-j>", function()
	require("smart-splits").resize_down()
end, { desc = "Resize Down" })
map("n", "<A-k>", function()
	require("smart-splits").resize_up()
end, { desc = "Resize Up" })

-- key mappings for mini.map
local MiniMap = require("mini.map")
map("n", "<Leader>mo", function()
	MiniMap.open()
end, { desc = "MiniMap Open Map" })
map("n", "<Leader>mc", function()
	MiniMap.close()
end, { desc = "MiniMap Close Map" })
map("n", "<Leader>mt", function()
	MiniMap.toggle()
end, { desc = "MiniMap Toggle map" })
map("n", "<Leader>mf", function()
	MiniMap.toggle_focus()
end, { desc = "MiniMap Toggle focus" })
map("n", "<Leader>mr", function()
	MiniMap.refresh()
end, { desc = "MiniMap Refresh Map" })
map("n", "<Leader>ms", function()
	MiniMap.toggle_side()
end, { desc = "MiniMap Toggle side" })

-- mappings for copilot chat
map("n", "<Leader>cco", ":CopilotChatOpen <cr>", { desc = "CopilotChat Open chat window" })
map("n", "<Leader>ccc", ":CopilotChatClose <cr>", { desc = "CopilotChat Close chat window" })
map("n", "<Leader>cct", ":CopilotChatToggle <cr>", { desc = "CopilotChat Toggle chat window" })

-- mappings for lazygit
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })

-- mappings for trouble.nvim
map("n", "<leader>tt", "<cmd>TroubleToggle<cr>", { desc = "Trouble Toggle" })
map(
	"n",
	"<leader>tw",
	"<cmd>TroubleToggle workspace_diagnostics<cr>",
	{ desc = "Trouble Toggle Workspace Diagnostics" }
)
map("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "Trouble Toggle Document Diagnostics" })
map("n", "<leader>tl", "<cmd>TroubleToggle loclist<cr>", { desc = "Trouble Toggle Loclist" })
map("n", "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", { desc = "Trouble Toggle Quickfix" })
map("n", "<leader>tlr", "<cmd>TroubleToggle lsp_references<cr>", { desc = "Trouble Toggle LSP References" })

-- mappings for nvim-dap
-- map("n", "<leader>dbp", function ()
--     require('dap').toggle_breakpoint()
-- end, { desc = "Dap Set breakpoints" })
-- map("n", "<leader>dct", function ()
--     require('dap').continue()
-- end, {desc = "dap Launch debug sessions/ resuming execution"})
-- map("n", "<leader>dso", function ()
--     require('dap').step_over()
-- end, {desc = "dap Step over"})
-- map("n", "<leader>dsi", function ()
--     require('dap').step_into()
-- end, {desc = "dap Step into"})
-- map("n", "<leader>dev", function ()
--     require('dapui').eval()
-- end)
-- map("n", "<leader>ded", function ()
--     require('dap').terminate()
-- end)

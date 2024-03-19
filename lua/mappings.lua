require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- key mappings for neogen plugin
map("n", "<leader>gen", function()
	require("neogen").generate()
end, { desc = "Genearte annotation template" })

-- key mappings for vim-tmux-navigater
map("n", "<C-h>", ":TmuxNavigateLeft <cr>", { desc = "Tmux Window left" })
map("n", "<C-l>", ":TmuxNavigateRight <cr>", { desc = "Tmux Window right" })
map("n", "<C-j>", ":TmuxNavigateDown <cr>", { desc = "Tmux Window down" })
map("n", "<C-k>", ":TmuxNavigateUp <cr>", { desc = "Tmux Window up" })

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

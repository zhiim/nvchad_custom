require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- custom gitsigns mappings
map("n", "<leader>gtb", function()
    require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle blame of each line"})

-- M.gitsigns = {
--   n = {
--     ["<leader>gtb"] = {
--       function()
--         require("gitsigns").toggle_current_line_blame()
--       end,
--       "Toggle blame of each line",
--     },
--   }
-- }
-- -- mappings for nvim-dap
-- M.dap = {
--     -- key mappings work in normal mode
--     n = {
--       -- set breakpoints
--       ["<leader>dbp"] = {
--           function()
--             require('dap').toggle_breakpoint()
--           end,
--           "Set breakpoints"
--       },
--       -- continue
--       ["<leader>dct"] = {
--           function()
--             require('dap').continue()
--           end,
--           "Launch debug sessions/ resuming execution"
--       },
--       -- setp over
--       ["<leader>dso"] = {
--           function()
--             require('dap').step_over()
--           end,
--           "Step over"
--       },
--       -- setp into
--       ["<leader>dsi"] = {
--           function()
--             require('dap').step_into()
--           end,
--           "Step into"
--       },
--         -- evaluate expression
--         ["<leader>dev"] = {
--             function()
--                 require('dapui').eval()
--             end
--         },
--         -- end the debug
--         ["<leader>ded"] = {
--             function()
--                 require('dap').terminate()
--             end
--         }
--     },
-- }
--
-- -- key mappings for neogen plugin
-- M.neogen = {
--     n = {
--         ["<leader>gen"] = {
--             function ()
--                 require("neogen").generate()
--             end,
--             "Genearte annotation template"
--         }
--     }
-- }
--
-- -- key mappings for vim-tmux-navigater
-- M.tmux = {
--     n = {
--         ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
--         ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
--         ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
--         ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
--     }
-- }

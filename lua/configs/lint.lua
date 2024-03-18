local lint = require('lint')

lint.linters_by_ft = {
  python = {"ruff"},
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})
-- set config file for ruff
local ruff_config
if vim.loop.os_uname().sysname == "Linux" then
    ruff_config = {"--config=" .. os.getenv("HOME") .. "/.config/nvim/ruff/pyproject.toml"}
else
    ruff_config = {"--config=".. os.getenv("UserProfile") .. "\\AppData\\Local\\nvim\\lua\\custom\\ruff\\pyproject.toml"}
end

local ruff = lint.linters.ruff
ruff.args = {
    "--config=/home/xu/.config/nvim/ruff/pyproject.toml"
}

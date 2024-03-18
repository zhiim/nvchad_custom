require('lint').linters_by_ft = {
  python = {'ruff',}
}

-- set config file for ruff
local ruff_config
if vim.loop.os_uname().sysname == "Linux" then
    ruff_config = {"--config=" .. os.getenv("HOME") .. "/.config/nvim/ruff/pyproject.toml"}
else
    ruff_config = {"--config=".. os.getenv("UserProfile") .. "\\AppData\\Local\\nvim\\lua\\custom\\ruff\\pyproject.toml"}
end

local ruff = require('lint').linters.ruff
ruff.args = ruff_config

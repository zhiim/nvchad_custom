-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "cmake" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- clangd setting, use mingw in windows
local clangd_mingw
if vim.loop.os_uname().sysname == "Windows_NT" then
    clangd_mingw = "--query-driver=" .. os.getenv("UserProfile") .. "\\scoop\\apps\\mingw\\current\\bin\\c++.exe"
    lspconfig.clangd.setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
        cmd = {
            "clangd",
            clangd_mingw
        }
    }
else
    -- if in linux
    lspconfig.clangd.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

-- 
-- lspconfig.pyright.setup { blabla}

-- pylsp settings
lspconfig.pylsp.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    settings = {
         pylsp = {
             plugins = {
                 pycodestyle = {
                     enabled = false
                 }
             }
         }
     }
 }


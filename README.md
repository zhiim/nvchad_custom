## Getting Started

### Pre-requisites

- [Nerd Font](https://www.nerdfonts.com/)
- Git
- GCC
- Make
- Ripgrep (optional, searching with telescope)
- Node.js (optional, using Prettier formatter)
- Python (optional, using LSP)
- Lazygit (optional, using lazygit plugin)
- Glow (optional, using glow plugin)

### Install

```bash
# Linux
git clone https://github.com/zhiim/nvchad_custom.git ~/.config/nvim
# Windows
git clone https://github.com/zhiim/nvchad_custom.git $ENV:USERPROFILE\AppData\Local\nvim

nvim
```

## Configure

### Neovim Setting

Edit `lua/options.lua`

### NvChad Setting

Edit `lua/chadrc.lua`

### Key Mapping

Set custom key mapping by editing `lua/mapping.lua`.

Check [Mappings](https://nvchad.com/docs/config/mappings) for details.

### Plugin Management

Plugin system is built with [lazy.nvim](https://github.com/folke/lazy.nvim).

Add plugins by editing `lua/plugins/init.lua`.

Launch lazy.nvim panel with command `:Lazy`.

### Add Program Language Support

#### Language Parsers

Built with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).

There are two methods to add a parser for specific language:

1. use built-in command `:TSInstall <language_to_install>`
2. modify `nvim-treesitter.opts.ensure_installed` in `lua/plugins/init.lua`, then it will be installed automatically.

Treesitter usage:

- `:TSUpdate {language}/all` to update Parsers
- `:TSInstallInfo` to check installation information for different languages
- `TSUninstall <package_to_uninstall>` to remove an installed package

#### LSP, Linter and Formatter Management

[Mason](https://github.com/williamboman/mason.nvim) is used to management language support packages.

Add new packages by modifying `mason.opts.ensure_installed` in `lua/plugins/init.lua`, then install with `:MasonInstallAll` or `:MasonInstall <packages>` command.

Launch Mason panel by `:Mason` command.

Mason usage:

- `:Mason` - opens a graphical status window
- `:MasonUpdate` - updates all managed registries
- `:MasonInstall <package> ...` - installs/re-installs the provided packages
- `:MasonUninstall <package> ...` - uninstalls the provided packages
- `:MasonUninstallAll` - uninstalls all packages
- `:MasonLog` - opens the mason.nvim log file in a new tab window

#### LSP Configuration

LSP configuration support is built with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).

Add LSP name to `server` in `lua/configs/lspconfig.lua` (check [server_configurations](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd) for support for specific LSP).

#### Format & Lint

Formatter is built with [conform.nvim](https://github.com/stevearc/conform.nvim).

Lintter is built with [nvim-lint](https://github.com/mfussenegger/nvim-lint).

Trun on a formatter or linter by editing `lua/configs/conform.lua` for formatter and `lua/configs/lint.lua` for linter.

#### Debugging Support

`nvim-dap`, `nvim-dap-ui` plugin have been added for debugging. Plugins for specific language debugging can be found in [Debug Adapter installation](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation).

### Tips

- To share clipboard with system, install `xclip` on Linux with X11, install `win32yank` on Windows for WSL.
- To use C++ linter with CMake, add `set(CMAKE_EXPORT_COMPILE_COMMANDS ON)` in CMakeList.txt. Also in Windows, `mingw` should be installed and `cmake` should use `make` or `ninja` as build generator.
- In Windows, `pylsp` should be used with `venv`.
- If `nvim-treesitter` output error `Invalid node type at position x for language x`, you can use `:echo nvim_get_runtime_file('parser', v:true)` to check whether more than one parser is used or not, than rename the nvim parser folder to another name to use treesitter parser only.
- Uncomment `event = "VeryLazy",` in `lua/plugins/init.lua` under "github/copilot.vim" to use github copilot and copilot chat.
- `rust-analyzer` should be installed globally using `rustup component add rust-analyzer` in Windows.

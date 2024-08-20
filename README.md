<h1 align="center">
  <p>Create your own IDE</p>
  <img src="https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-300x87.png" alt="Neovim">
</h1>

__*Quick Links*__
- *Main*
  - [Init](init.lua)
- *Opcional*
  - [Keymaps](lua/vim-keymaps.lua)
  - [Options](lua/vim-options.lua)
- *Plugins*
  - [Completions](lua/plugins/completions.lua)
  - [Debugging (DAP)](lua/plugins/debugging.lua)
  - [LSP](lua/plugins/lsp.lua)
  - [Lualine](lua/plugins/lualine.lua)
  - [NeoTree](lua/plugins/neo-tree.lua)
  - [NoneLS](lua/plugins/none-ls.lua)
  - [Telescope](lua/plugins/telescope.lua)
  - [TokyoNight](lua/plugins/tokyo-night.lua)
  - [TreeSitter](lua/plugins/treesitter.lua)
  - 
# Overview
This guide will walk you through the process of creating a custom Integrated Development Environment (IDE) using Neovim. By leveraging Neovim’s powerful features and extensive plugin ecosystem, you can tailor the editor to meet your specific development needs. Here’s what you can expect from the guide:

- __Setting Up Neovim__
  - Installation
- __Customizing the Development Environment__
  - Plugin management
- __Enhancing Productivity__

By the end of this guide, you will have a fully customized IDE built on Neovim, tailored to your specific development needs and preferences. Whether you're a seasoned developer or new to Neovim, this guide will help you harness the full potential of this powerful text editor.

# Setting Up Neovim
## Installation
If you are using a linux system then you can install neovim using the following commands.
1. __Ubuntu and Debian-Based Systems__

   Using *apt* (for Ubuntu 20.04 and later, Debian 10 and later)
   ```
   sudo apt update
   sudo apt install neovim -y
   ```

   Using *snap* (for Ubuntu 20.04 and later)
   ```
   sudo snap install nvim --classic
   ```

   Using *ppa* (for newer versions or older distributions)
   ```
   sudo add-apt-repository ppa:neovim-ppa/stable
   sudo apt update
   sudo apt install neovim
   ```
2. __Fedora__

   ```
   sudo dnf install neovim
   ```
3. __CentOS/RHEL__

   Using *dnf* (for CentOS 8/RHEL 8 or later)
   ```
   sudo dnf install epel-release
   sudo dnf install neovim
   ```

   Using *yum* (for CentOS 7/RHEL 7)
   ```
   sudo yum install epel-release
   sudo yum install neovim
   ```
4. __Arch Linux__

   ```
   sudo pacman -S neovim
   ```
5. __openSUSE__

   ```
   sudo zypper install neovim
   ```
6. __Alpine Linux__

   ```
   sudo apk add neovim
   ```

If you are using Windows instead, follow this:

__Chocolatey Installation__
1. Open PowerShell using administrator privileges
2. Run
   ```
   Get-ExecutionPolicy 
   ```

   If it returns *Restricted*, then run
   ```
   Set-ExecutionPolicy AllSigned 
   ```
3. Now run the following command:
   ```
   Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
   ```

Once we installed Chocolatey, we can now install now neovim by running the following command:
```
choco install neovim -y
```

# Customizing the Development Environment
## Plugin Manager
We will use [Lazy.nvim](https://lazy.folke.io/) as our plugin manager for Neovim. Lazy.nvim is designed to be fast, flexible, and minimalistic, making it an excellent choice for managing plugins efficiently. It is a key player in the expanding ecosystem of Neovim plugin managers, each of which provides unique features and trade-offs.

__Requirements to use lazy.nvim__
- Neovim >= 0.8.0 (needs to be built with *LuaJIT*)
- Git >= 2.19.0 (for partial clones supports)
- A [Nerd font](https://www.nerdfonts.com/) __(optional)__

## Tokyo Night
[Tokyo Night](https://github.com/folke/tokyonight.nvim) is the color scheme I used for my IDE, but you can choose another.

<img width="1094" alt="Captura de pantalla 2024-08-20 121443" src="https://github.com/user-attachments/assets/403b69c1-a4ba-459c-8f9d-dadf0a9251bf">

## Telescope
[Telescope](https://github.com/nvim-telescope/telescope.nvim) is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core. Telescope is centered around modularity, allowing for easy customization.

![Preview](https://i.imgur.com/TTTja6t.gif)

__Requirements for Telescope__
- Install *ripgrep*

  If you are using linux
  1. __Ubuntu and Debian-Based System__
     ```
     sudo apt update
     sudo apt install ripgrep -y
     ```
  2. __Fedora__
     ```
     sudo dnf install ripgrep
     ```
  3. __CentOS/RHEL__

     Using *dnf* (for CentOS 8/RHEL 8 or later)
     ```
     sudo dnf install epel-release
     sudo dnf install ripgrep
     ```
     Using *yum* (for CentOS 7/RHEL 7)
     ```
     sudo yum install epel-release
     sudo yum install ripgrep
     ```
  5. __Arch Linux__
     ```
     sudo pacman -S ripgrep
     ```
  6. __openSUSE__
     ```
     sudo zypper install ripgrep
     ```

  7. __Alpine Linux__
     ```
     sudo apk add ripgrep
     ```
  If you are using Windows instead, run the following command:
  ```
  choco install ripgrep
  ```

Telescope UI select sets `vim.ui.select` to telescope. That means for example that neovim core stuff can fill the telescope picker. Example would be `lua vim.lsp.buf.code_action()`.

<img width="1094" alt="Telescope UI Select code_action" src="https://github.com/user-attachments/assets/7a999f22-16a8-40c6-bfdc-a7437f7ab34f">

## TreeSitter
[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) is a parser generator tool and an incremental parsing library used in various text editors, including Neovim, to provide precise and efficient syntax highlighting, code navigation, and other code-aware features.

![202753610-e923bf4e-e88f-494b-bb1e-d22a7688446f](https://github.com/user-attachments/assets/dfb31c66-5abd-46dd-872c-001d29e9a94b)

Traditional highlighting (left) vs Treesitter-based highlighting (right). More examples can be found [here](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Gallery).

## NeoTree
[Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) is a Neovim plugin to browse the file system and other tree like structures in whatever style suits you, including sidebars, floating windows, netrw split style, or all of them at once.

<img width="1094" alt="image" src="https://github.com/user-attachments/assets/51cabda1-9587-445d-ade6-34a8a9ed34d9">

## Lualine
[Lualine](https://github.com/nvim-lualine/lualine.nvim) is a fast and highly customizable status line plugin for Neovim, written in Lua. It is designed to replace the default status line in neovim with more modern, feature-rich, and configurable alternative.

<p>
<img width='700' src='https://user-images.githubusercontent.com/41551030/108650373-bb025580-74bf-11eb-8682-2c09321dd18e.png'/>
<img width='700' src='https://user-images.githubusercontent.com/41551030/108650377-bd64af80-74bf-11eb-9c55-fbfc51b39fe8.png'/>
<img width='700' src='https://user-images.githubusercontent.com/41551030/108650378-be95dc80-74bf-11eb-9718-82b242ecdd54.png'/>
<img width='700' src='https://user-images.githubusercontent.com/41551030/108650381-bfc70980-74bf-11eb-9245-85c48f0f154a.png'/>
<img width='700' src='https://user-images.githubusercontent.com/41551030/103467925-32372b00-4d54-11eb-88d6-6d39c46854d8.png'/>
</p>

# Mason & LSP (Language Server Protocol)
[Mason](https://github.com/williamboman/mason.nvim) is a portable package manager for Neovim that runs everywhere Neovim runs. Manage LSP server, DAP servers, linters and formatters.

<img width="824" alt="image" src="https://github.com/user-attachments/assets/594a692c-e511-423d-8f0c-30948f224923">

[Mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) bridges `mason.nvim` with the `lspconfig` plugin, making it easier to use both plugins together.

__Requirements to use mason-lspconfig.nvim__
- Neovim >= 0.7.0
- mason.nvim
- lspconfig

[Nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) is a core Neovim plugin that provides configurations for integrating Neovim with various Language Server Protocol (LSP) servers. It makes it easier to set up LSP servers for differents programming languages.

## Null-ls
[Null-ls](https://github.com/nvimtools/none-ls.nvim) is a powerful and flexible plugin for Neovim that acts as a bridge between external tools and Neovim's built-in Language Server Protocol (LSP) client. It allows you to use non-LSP sources like linters, formatters, and other code analysis tools within Neovim as if they were part of the LSP ecosystem.

## Completions
Completions.lua use [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) a completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories and "sourced".

https://github.com/user-attachments/assets/f1516e03-b334-4c0a-b405-50ff36515c88

## Debugging
debugging.lua use [nvim-dap](https://github.com/mfussenegger/nvim-dap) a Debug Adapter Protocol client implementation for Neovim. `nvim-dap` allows you to:
  - Launch an application to debug
  - Attach to running applications and debug them
  - Set breakpoints and step through code
  - Insepct the state of the application

# Enhancing Productivity
## Keybindings
These are my default keybindings:

| Key                     | Action                           |
| ----------------------- | -------------------------------- |
| __Ctrl + c__            | Copy                             |
| __Ctrl + v__            | Paste                            |
| __Ctrl + x__            | Cut                              |
| __Ctrl + z__            | Undo  Operation                  |
| __Ctrl + y__            | Redo Operation                   |
| __Ctrl + s__            | Save file                        |
| __Ctrl + n__            | Show Neo-tree file explorer      |
| __Space + ff__          | Find files                       |
| __Space + fg__          | Live grep                        |
| __K__                   | Show hover information           |
| __Space + gd__          | Go to definition                 |
| __Space + gr__          | Find references                  |
| __Space + ca__          | Show code actions                |
| __Space + gf__          | Format the current buffer        |

__Completion keybindings__

| Key                     | Action                           |
| ----------------------- | -------------------------------- |
| __Ctrl + b__            | Scroll documentation up          |
| __Ctrl + f__            | Scroll documentation down        |
| __Ctrl + space__        | Trigger completion               |
| __Ctrl + e__            | Abort completion                 |

__Debugging keybindings__

| Key                     | Action                           |
| ----------------------- | -------------------------------- |
| __Space + db__          | Toggle breakpoint                |
| __Space + dc__          | Continue                         |

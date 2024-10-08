<h1 align="center">
  <p>Create your own IDE</p>
  <img src="https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-300x87.png" alt="Neovim">
</h1>

__Language__
  - [<sub>ES</sub> Español](README.es.md)
  - <sub>EN</sub> English

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

<p align="center">
  <img width="670" alt="image" src="https://github.com/user-attachments/assets/faea1641-3b72-4d73-a0fa-8c0e09f781a5">
</p>

__Requirements for lazy.nvim__
- Neovim >= 0.8.0 (needs to be built with *LuaJIT*)
- Git >= 2.19.0 (for partial clones supports)
- A [Nerd font](https://www.nerdfonts.com/) __(optional)__

## Tokyo Night
[Tokyo Night](https://github.com/folke/tokyonight.nvim) is the color scheme I used for my IDE, but you can choose another.

<p align="center">
  <img width="1094" alt="Captura de pantalla 2024-08-20 121443" src="https://github.com/user-attachments/assets/403b69c1-a4ba-459c-8f9d-dadf0a9251bf">  
</p>

## Telescope
[Telescope](https://github.com/nvim-telescope/telescope.nvim) is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core. Telescope is centered around modularity, allowing for easy customization.

<p align="center">
  <img width="842" alt="image" src="https://github.com/user-attachments/assets/cfe82028-a792-45f0-8b1c-5811a28a5d14">
</p>

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
<p align="center">
  <img width="1094" alt="Telescope UI Select code_action" src="https://github.com/user-attachments/assets/7a999f22-16a8-40c6-bfdc-a7437f7ab34f">
</p>

## TreeSitter
[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) is a parser generator tool and an incremental parsing library used in various text editors, including Neovim, to provide precise and efficient syntax highlighting, code navigation, and other code-aware features.

<p align="center">
  ![202753610-e923bf4e-e88f-494b-bb1e-d22a7688446f](https://github.com/user-attachments/assets/dfb31c66-5abd-46dd-872c-001d29e9a94b)
</p>

Traditional highlighting (left) vs Treesitter-based highlighting (right). More examples can be found [here](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Gallery).

## NeoTree
[Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) is a Neovim plugin to browse the file system and other tree like structures in whatever style suits you, including sidebars, floating windows, netrw split style, or all of them at once.

<p align="center">
  <img width="841" alt="image" src="https://github.com/user-attachments/assets/fc9c2634-eeee-475a-b658-109949bd02c7">
</p>

## Lualine
[Lualine](https://github.com/nvim-lualine/lualine.nvim) is a fast and highly customizable status line plugin for Neovim, written in Lua. It is designed to replace the default status line in neovim with more modern, feature-rich, and configurable alternative.

<p align="center">
  <img width="700" alt="image" src="https://github.com/user-attachments/assets/4021ab01-3a87-4075-b356-ed4906f29357">
  <img width="700" alt="image" src="https://github.com/user-attachments/assets/28c8a544-09ea-4ea5-83f9-d843d79bf038">
  <img width="700" alt="image" src="https://github.com/user-attachments/assets/9b998d40-b85e-49d4-a720-19af9ecb35e7">
  <img width="700" alt="image" src="https://github.com/user-attachments/assets/72863729-615b-407d-aecb-866826fccb1a">
</p>

# Mason & LSP (Language Server Protocol)
[Mason](https://github.com/williamboman/mason.nvim) is a portable package manager for Neovim that runs everywhere Neovim runs. Manage LSP server, DAP servers, linters and formatters.

<p align="center">
  <img width="824" alt="image" src="https://github.com/user-attachments/assets/594a692c-e511-423d-8f0c-30948f224923">
</p>

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

<p align="center">
  <img width="840" alt="image" src="https://github.com/user-attachments/assets/d5db68e0-612f-444d-8717-2d32b716ad6e">
</p>

## Debugging
debugging.lua use [nvim-dap](https://github.com/mfussenegger/nvim-dap) plugin a Debug Adapter Protocol client implementation for Neovim. `nvim-dap` allows you to:
  - Launch an application to debug
  - Attach to running applications and debug them
  - Set breakpoints and step through code
  - Insepct the state of the application

And [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) plugin a UI for nvim-dap which provides a good out of the box configuration.

<p align="center">
  ![preview](https://user-images.githubusercontent.com/24252670/191198389-a1321363-c0f1-4ff1-b663-ab1350d2b393.png)
</p>

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
| __Space + ds__          | Step over                        |
| __Space + di__          | Step into                        |
| __Space + do__          | Step out                         |

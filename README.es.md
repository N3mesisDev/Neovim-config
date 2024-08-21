<h1 align="center">
  <p>Create your own IDE</p>
  <img src="https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-300x87.png" alt="Neovim">
</h1>

__Idioma__
 - <sub>ES</sub> Español
 - [<sub>EN</sub> English](README.md)

__*Enlaces Rápidos*__
- *Principal*
  - [Init](init.lua)
- *Opcional*
  - [Keymaps](lua/vim-keymaps.lua)
  - [Options](lua/vim-options.lua)
- *Complementos*
  - [Completions](lua/plugins/completions.lua)
  - [Debugging (DAP)](lua/plugins/debugging.lua)
  - [LSP](lua/plugins/lsp.lua)
  - [Lualine](lua/plugins/lualine.lua)
  - [NeoTree](lua/plugins/neo-tree.lua)
  - [NoneLS](lua/plugins/none-ls.lua)
  - [Telescope](lua/plugins/telescope.lua)
  - [TokyoNight](lua/plugins/tokyo-night.lua)
  - [TreeSitter](lua/plugins/treesitter.lua)

# Descripción General
Esta guia lo guiará en el proceso de la creación de un Entorno de Desarrollo Integrado (IDE) personalizado usando Neovim. Al aprovechar las potentes funciones y el extenso ecosistema de complementos de Neovim, puede adaptar el editor para satisfacer sus necesidades de desarrollo específicas. Esto es lo que puede esperar de la guía:

- __Configuración de Neovim__
  - Instalación
- __Personalizar el entorno de desarrollo__
  - Gestión de complementos
- __Mejora de la productividad__

Al final de esta guía, tendrá un IDE totalmente personalizado construido en Neovim, adaptado a sus necesidades y preferencias de desarrollo específicas. Ya sea que sea un desarrollador experimentado o nuevo en Neovim, esta guía lo ayudará a aprovechar todo el potencial de este poderoso editor de texto.

# Configuración de Neovim
## Instalación
Si está utilizando un sistema Linux, puede instalar neovim usando los siguientes comandos.
1. __Ubuntu y sistemas basados ​​en Debian__
   Usando *apt* (para Ubuntu 20.04 y posteriores, Debian 10 y posteriores)
   ```
   sudo apt update
   sudo apt install neovim -y
   ```
   Usando *snap* (para Ubuntu 20.04 y posteriores)
   ```
   sudo snap install nvim --classic
   ```

   Usando *ppa* (para nuevas versiones o distribuciones antiguas)
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

   Usando *dnf* (para CentOS 8/RHEL 8 o posteriores)
   ```
   sudo dnf install epel-release
   sudo dnf install neovim
   ```

   Usando *yum* (para CentOS 7/RHEL 7)
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

Si estás usando Windows, sigue estos pasos:
__Instalación de Chocolatey__
1. Abre PowerShell usando privilegios de adminsitrador
2. Ejecuta:
    ```
   Get-ExecutionPolicy 
   ```

   Si devuelve *Restricted*, entonces ejecuta:
   ```
   Set-ExecutionPolicy AllSigned 
   ```
3. Ahora ejecuta el siguiente comando
   ```
   Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
   ```
Una vez instalado Chocolatey, ahora podemos instalar Neovim ejecutando el siguiente comando:
```
choco install neovim -y
```

# Personalizando el Entorno de Desarrollo
## Administrador de Complementos
Usaremos [Lazy.nvim](https://lazy.folke.io/) como administrador de complementos para Neovim. Lazy.nvim esta diseñado para ser rápido, felxible, y minimalista, haciendole una opción exelente para administrar complementos eficientemente. Es un jugador clave en la expansión del ecosistema de administradción de complementos de Neovim, cada uno de los cuales proporciona caracteristicas y compensaciones únicas.

<p align="center">
  <img width="670" alt="image" src="https://github.com/user-attachments/assets/faea1641-3b72-4d73-a0fa-8c0e09f781a5">
</p>

__Requerimientos para lazy.nvim__
- Neovim >= 0.8.0 (necesita ser construido con *LuaJIT*)
- Git >= 2.19.0 (para soportes de clones parciales)
- A [Nerd font](https://www.nerdfonts.com/) __(opcional)__

## Tokyo Night
[Tokyo Night](https://github.com/folke/tokyonight.nvim) es el esquema de color que he utilizado para mi IDE, pero podeis escoger otro distinto.

<p align="center">
  <img width="1094" alt="Captura de pantalla 2024-08-20 121443" src="https://github.com/user-attachments/assets/403b69c1-a4ba-459c-8f9d-dadf0a9251bf">  
</p>

## Telescope
[Telescope](https://github.com/nvim-telescope/telescope.nvim) es un buscador difuso altamente extendible sobre listas. Construido sobre las últimas características impresionantes de neovim core. El telescopio se centra en la modularidad, lo que permite una fácil personalización.

<p align="center">
  <img width="842" alt="image" src="https://github.com/user-attachments/assets/cfe82028-a792-45f0-8b1c-5811a28a5d14">
</p>

__Requerimientos para Telescope__
- Instalar *ripgrep*

  Si usas linux
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

     Usando *dnf* (para CentOS 8/RHEL 8 o posteriores)
     ```
     sudo dnf install epel-release
     sudo dnf install ripgrep
     ```
     Usando *yum* (para CentOS 7/RHEL 7)
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
  Si usas Windows, ejecuta el siguiente comando:
  ```
  choco install ripgrep
  ```
Telescope UI select establece `vim.ui.select` en el telescopio. Esto significa, por ejemplo, que el material del nucleo de Neovim puede llenar el selector del telescopio. Un ejemplo seria `lua vim.lsp.buf.code_action()`.
<p align="center">
  <img width="1094" alt="Telescope UI Select code_action" src="https://github.com/user-attachments/assets/7a999f22-16a8-40c6-bfdc-a7437f7ab34f">
</p>

## TreeSitter
[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) es una herramienta generadora de analizador y una libreria analizadora incremental usado en diversos editores de texto, incluido Neovim, para proporcionar un resaltado de sintaxis preciso y eficiente, navegación de código, y otras funciones con reconocimiento de código.

<p align="center">
  ![202753610-e923bf4e-e88f-494b-bb1e-d22a7688446f](https://github.com/user-attachments/assets/dfb31c66-5abd-46dd-872c-001d29e9a94b)
</p>

Reslatado tradicional (izquierda) vs resaltado basado en Treesitter (derecha). Más ejemplos pueden ser encontrados [aquí](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Gallery).

## NeoTree
[Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) es un complemento de Neovimm para navegar los ficheros del sistema y otras estructuras tipo árbol en el estilo que más le convenga, incluyendo barras laterales, ventantas flotantes, estilo dividido netrw, o todos ellos a la vez.

<p align="center">
  <img width="841" alt="image" src="https://github.com/user-attachments/assets/fc9c2634-eeee-475a-b658-109949bd02c7">
</p>

## Lualine
[Lualine](https://github.com/nvim-lualine/lualine.nvim) es un complemento de línia de estado rápido y altamente personalizable para Neovim, escrito en Lua. Está diseñado para reemplazar la línia de estatus por defecto en Neovim con otra alternativa más moderna, rico en funciones, y configurable.

<p align="center">
  <img width="700" alt="image" src="https://github.com/user-attachments/assets/4021ab01-3a87-4075-b356-ed4906f29357">
  <img width="700" alt="image" src="https://github.com/user-attachments/assets/28c8a544-09ea-4ea5-83f9-d843d79bf038">
  <img width="700" alt="image" src="https://github.com/user-attachments/assets/9b998d40-b85e-49d4-a720-19af9ecb35e7">
  <img width="700" alt="image" src="https://github.com/user-attachments/assets/72863729-615b-407d-aecb-866826fccb1a">
</p>

## Mason & LSP (Language Server Protocol)
[Mason](https://github.com/williamboman/mason.nvim) es un administrador de paquetes portables para Neovim que corre dondequiere corre Neovim. Administra servidor LSP, servidores DAP, linters y fomrateadores.

<p align="center">
  <img width="824" alt="image" src="https://github.com/user-attachments/assets/594a692c-e511-423d-8f0c-30948f224923">
</p>

[Mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) puentea `mason.nvim` con el complemento `lspconfig`, haciendo que puedas usar ambos complementos junto de forma fácil.

__Requerimientos para usar mason-lspconfig.nvim__
- Neovim >= 0.7.0
- mason.nvim
- lspconfig

[Nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) es un complemento núcleo de Neovim que proporciona configuraciones para integrar Neovim con diferentes servidores Protocolo de servidor de idiomas (LSP). Facilita la configuración de servidores LSP con diferentes lenguajes de programación.

## Null-ls
[Null-ls](https://github.com/nvimtools/none-ls.nvim) es un complemento potente y flexible para 
Neovim que actua como un puente entre herramientas externas y el cliente de protocolo de servidor de idiomas (LSP) integrado en Neovim. Te permite usar funtes que no sean LSP como linters, formateadores, i otras herramientas de análisis de código dentro de Neovim como si fueran parte del ecosistema LSP.

## Completions
Completions.lua usa [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) un complemento de motor de finalización para Neovim escrito en Lua. Las fuentes de finalización se instalan desde repositorios externos y se "obtienen".

<p align="center">
  <img width="840" alt="image" src="https://github.com/user-attachments/assets/d5db68e0-612f-444d-8717-2d32b716ad6e">
</p>

## Debugging
debugging.lua usa el complemento [nvim-dap](https://github.com/mfussenegger/nvim-dap) una implementación de cliente de protocolo adaptador de depuración para neovim. `nvim-dap` te permite:
  - Iniciar una aplicación para depurar
  - Adjuntar a aplicaciones en ejecución y depurarlas
  - Establecer puntos de interrupción y recorrer el código
  - Inspeccionar el estado de la aplicación

I el complemento [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) una IU para nvim-dap que proporciona una buena configuración lista para usar.

<p align="center">
  ![preview](https://user-images.githubusercontent.com/24252670/191198389-a1321363-c0f1-4ff1-b663-ab1350d2b393.png)
</p>

# Mejorar la Productividad
## Combinaciones de Teclas
Estas son mis combinaciones de teclas por defecto

| Tecla                   | Acción                                 |
| ----------------------- | -------------------------------------- |
| __Ctrl + c__            | Copiar                                 |
| __Ctrl + v__            | Pegar                                  |
| __Ctrl + x__            | Cortar                                 |
| __Ctrl + z__            | Deshacer Operación                     |
| __Ctrl + y__            | Rehacer Operación                      |
| __Ctrl + s__            | Guardar archivo                        |
| __Ctrl + n__            | Mostrar explorador de archivos         |
| __Space + ff__          | Buscar archivos                        |
| __Space + fg__          | Grupo en vivo                          |
| __K__                   | Mostrar información al pasar el cursor |
| __Space + gd__          | Ir a definción                         |
| __Space + gr__          | Buscar referencias                     |
| __Space + ca__          | Mostrar acciones de código             |
| __Space + gf__          | Formatear el buffer actual             |

__Combinaciones de taclas de finalización__

| Tecla                   | Acción                                       |
| ----------------------- | -------------------------------------------- |
| __Ctrl + b__            | Desplazarse hacia arriba en la documentación |
| __Ctrl + f__            | Desplazarse hacia abajo en la documentación  |
| __Ctrl + space__        | Finalizador de disparador                    |
| __Ctrl + e__            | Abortar finalización                         |

__Combinaciones de teclas de depurarción__

| Tecla                   | Acción                           |
| ----------------------- | -------------------------------- |
| __Space + db__          | Alternar punto de interrupción   |
| __Space + dc__          | Continuar                        |
| __Space + ds__          | Paso por encima                  |
| __Space + di__          | Entra                            |
| __Space + do__          | Salir                            |

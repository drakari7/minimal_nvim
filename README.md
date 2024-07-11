# Shreyash's Neovim configuration files.

## Requirements
Neovim version >= 0.10.0


## Installation
Run the following command to clone my config files to your system
```bash
mv ~/.config/nvim ~/.config/nvim.bak        # Create a backup of existing config files
git clone https://github.com/drakari7/minimal_nvim ~/.config/nvim
```

You'll have to source a working version of neovim by yourself. Ensure that the version is >= 0.10.0.\
Then run `nvim` to open neovim for the first time. It will install all the plugins by itself.


## Language server support
On startup neovim will try to install the LSP for a few different languages such as `pyright` for python or `clangd` for cpp.\
These are external dependencies and not packaged with neovim or my config files.\
The installation of these dependencies requires `npm` (Node package manager).\
If you wish to use the language server features, ensure that you have a working version of `npm`.

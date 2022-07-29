-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
-- vim.cmd([[packadd packer.nvim]])

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'              -- Packer manages itself

  -- LSP and nvim core
  use 'neovim/nvim-lspconfig'               -- Basic LSP plugin
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'williamboman/nvim-lsp-installer'
  use {'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Functionality plugins
  use 'windwp/nvim-autopairs'               -- Autoclose brackets
  use 'famiu/bufdelete.nvim'                -- Delete buffers nicely
  use 'tpope/vim-unimpaired'                -- Symmetric mappings
  use 'tpope/vim-commentary'                -- Easy comments
  use 'tpope/vim-surround'                  -- change surroundings
  use 'tpope/vim-repeat'                    -- For repeating stuff
  -- use 'lukas-reineke/indent-blankline.nvim' -- Indentation lines

  -- LSP related plugins
  use 'simrat39/symbols-outline.nvim'       -- Symbol table

  -- Completion Plugins
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  -- Telescope
  -- use 'nvim-telescope/telescope.nvim'       --File finder and grep
  -- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- use "nvim-telescope/telescope-file-browser.nvim"

  -- Colors and aesthetics
  use 'ellisonleao/gruvbox.nvim'

  -- Statusline and bufferline
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/bufferline.nvim'
end)

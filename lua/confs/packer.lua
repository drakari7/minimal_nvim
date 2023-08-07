local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local packer = require('packer')

local map = require('confs.utils').map
map('n', '<leader>ps', packer.sync, 'Packer Sync')
map('n', '<leader>pc', packer.clean, 'Packer Clean')
map('n', '<leader>pu', packer.update, 'Packer Update')

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'              -- Packer manages itself

  -- LSP and nvim core
  use 'neovim/nvim-lspconfig'               -- Basic LSP plugin
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason.lspconfig.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Functionality plugins
  use 'windwp/nvim-autopairs'               -- Autoclose brackets
  use 'tpope/vim-repeat'                    -- For repeating stuff
  use 'tpope/vim-abolish'                   -- For better substitution
  use 'folke/which-key.nvim'                -- easy keymap guide
  use 'folke/flash.nvim'                    -- Navigation
  use 'lukas-reineke/indent-blankline.nvim' -- Indentation lines
  use 'nvim-orgmode/orgmode'                -- Orgmode

  -- Mini nvim
  use 'echasnovski/mini.nvim'               -- Collection of plugins

  use 'nvim-tree/nvim-tree.lua'             -- File tree
  use 'nvim-tree/nvim-web-devicons'         -- Icons

  -- Greeter
  use 'mhinz/vim-startify'                  -- Startpage
  use 'goolord/alpha-nvim'                  -- Startpage TODO: replace vim startify
  -- use 'nvimdev/dashboard-nvim'                  -- Startpage

  -- Git integration
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'                  -- Git commands in nvim

  -- SpeedUp
  use 'dstein64/vim-startuptime'

  -- LSP related plugins
  use 'stevearc/aerial.nvim'                -- Symbol table
  use 'onsails/lspkind.nvim'                -- Icons
  use 'ray-x/lsp_signature.nvim'            -- Function signatures
  use 'folke/neodev.nvim'                   -- Nvim lua api completions and setup

  -- Miscellaneous
  -- use 'christoomey/vim-tmux-navigator'      -- Tmux integration

  -- Debugging
  -- use 'mfussenegger/nvim-dap'               -- Debugging engine
  -- use 'rcarriga/nvim-dap-ui'                -- UI and overlay
  -- use 'theHamsta/nvim-dap-virtual-text'     -- Virtual text summary

  -- Terminal
  use 'akinsho/toggleterm.nvim'             -- better terminal

  -- Completion Plugins
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'

  -- Snippets
  use 'L3MON4D3/LuaSnip'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'       --File finder and grep
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Colors and aesthetics
  use 'norcalli/nvim-colorizer.lua'         -- Color hexcodes
  use 'ellisonleao/gruvbox.nvim'

  -- Statusline and bufferline
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/bufferline.nvim'

  -- Automatically install packer if not installed
  if packer_bootstrap then
    packer.sync()
  end
end)



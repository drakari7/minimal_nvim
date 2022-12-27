vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'              -- Packer manages itself

  -- LSP and nvim core
  use 'neovim/nvim-lspconfig'               -- Basic LSP plugin
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason.lspconfig.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'

  -- Functionality plugins
  use 'windwp/nvim-autopairs'               -- Autoclose brackets
  use 'famiu/bufdelete.nvim'                -- Delete buffers nicely
  use 'tpope/vim-unimpaired'                -- Symmetric mappings
  use 'numToStr/Comment.nvim'               -- Easy comments
  use 'tpope/vim-surround'                  -- change surroundings
  use 'tpope/vim-repeat'                    -- For repeating stuff
  use 'tpope/vim-abolish'                   -- For better substitution
  use 'mhinz/vim-startify'                  -- Startpage
  use 'folke/which-key.nvim'                -- easy keymap guide
  use 'lukas-reineke/indent-blankline.nvim' -- Indentation lines

  use {'kyazdani42/nvim-tree.lua',          -- File tree
    requires = 'kyazdani42/nvim-web-devicons' -- Icons
  }

  -- Git integration
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'                  -- Git commands in nvim

  -- SpeedUp
  use 'nathom/filetype.nvim'
  use 'lewis6991/impatient.nvim'
  use 'dstein64/vim-startuptime'

  -- LSP related plugins / miscellaneous
  -- use 'simrat39/symbols-outline.nvim'       -- Symbol table
  use 'stevearc/aerial.nvim'                -- Symbol table
  use 'ray-x/lsp_signature.nvim'            -- Function signatures
  use 'ggandor/leap.nvim'                   -- Code navigation
  -- use 'jose-elias-alvarez/null-ls.nvim'     -- Formatting

  -- Debugging
  -- use 'mfussenegger/nvim-dap'               -- Debugging engine
  -- use 'rcarriga/nvim-dap-ui'                -- UI and overlay
  -- use 'theHamsta/nvim-dap-virtual-text'     -- Virtual text summary

  -- Terminal wrapper
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
  use "nvim-telescope/telescope-file-browser.nvim"
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Colors and aesthetics
  use 'norcalli/nvim-colorizer.lua'         -- Color hexcodes
  use 'ellisonleao/gruvbox.nvim'

  -- Statusline and bufferline
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/bufferline.nvim'
end)

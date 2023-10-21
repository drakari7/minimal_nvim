return {
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'dstein64/vim-startuptime',
  'onsails/lspkind.nvim',

  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    init = function ()
      vim.o.background = "dark"
      vim.cmd([[
        colorscheme gruvbox
        source ~/.config/nvim/after/colors.vim
        source ~/.config/nvim/after/telescope_theme.vim
      ]])
    end
  },

  {
    'numToStr/Comment.nvim',
    opts = {},
  },

  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {}
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = { enabled = false },
      exclude = { filetypes = { "help", "norg", "lazy", "mason", "notify", "startify" } }
    },
  },

  -- Color hexcodes
  {
    'norcalli/nvim-colorizer.lua',
    opts = {
      names = false
    },
    keys = {
      { "<leader>co", ":ColorizerToggle<CR>" }
    }
  },
}

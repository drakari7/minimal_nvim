local map = require('confs.utils').map
return {
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'dstein64/vim-startuptime',
  'onsails/lspkind.nvim',
  'tpope/vim-fugitive',
  'tpope/vim-abolish',
  'LunarVim/bigfile.nvim',

  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    init = function()
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
      { "<leader>co", ":ColorizerToggle<CR>", desc = "Toggle colorizer" }
    }
  },

  -- File explorer
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        columns = { "icon", "size", "mtime" },
        view_options = { show_hidden = true }
      })

      map('n', '<leader>oi', '<cmd>Oil<CR>', "Open parent directory")
      -- map('n', '<leader>-', require('oil').toggle_float, "Open parent directory in a float")
    end,
  },
}

local map = require('confs.utils').map
return {
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'onsails/lspkind.nvim',
  'tpope/vim-abolish',      -- for :S [:Subvert] substitutions

  {
    'tpope/vim-fugitive',     -- Git commands
    keys = {
      { "<leader>gb", ":Git blame<CR>", desc = "Git blame" }
    }
  },

  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
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

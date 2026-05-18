local map = require('confs.utils').map
return {
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'onsails/lspkind.nvim',
  'tpope/vim-abolish',      -- for :S [:Subvert] substitutions

  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
  },

  {
    'brenoprata10/nvim-highlight-colors',
    opts = {
      render = 'background',       -- 'background' | 'foreground' | 'first_column' | 'virtual'
      enable_named_colors = true, -- don't match 'red', 'blue', etc.
      enable_tailwind = false,
    },
    keys = {
      { "<leader>co", "<cmd>HighlightColors Toggle<CR>", desc = "Toggle highlight colors" }
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
    end,
  },
}

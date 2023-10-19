return {
  {
    'stevearc/aerial.nvim',                -- Symbol table
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    config = function(_, opts)
      local aerial = require('aerial')
      aerial.setup(opts)
      local map = require('confs.utils').map
      map('n', '<leader>ao', function() aerial.toggle{focus=false} end, 'Aerial toggle')
      map('n', '<leader>an', aerial.nav_toggle, 'Aerial nav toggle')
      map('n', '<leader>af', aerial.focus, 'Aerial focus')
      map('n', '<leader>ac', aerial.close_all, 'Aerial Close all')
      map('n', ']a', aerial.next, 'Aerial next')
      map('n', '[a', aerial.prev, 'Aerial prev')
    end,
    opts = {
      layout = {
        max_width = { 30, 0.16 },
        min_width = { 15, 0.1 },
        -- width = nil,
        default_direction = "prefer_right",
        placement = "window",
      },

      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
      },

      backends = { "treesitter", "markdown"},
      close_automatic_events = {"unsupported"},
      attach_mode = "window",
      show_guides = true,

      manage_folds = true,
      link_tree_to_folds = true,
      -- link_folds_to_tree = true,

      highlight_on_jump = false,     -- Set a value in milliseconds or false to disable
      nav = {
        min_height = {30, 0.6},
        preview = true,
        win_opts = {
          cursorline = false,
        },
        keymaps = {
          ["q"] = "actions.close",
        }
      }
    },
  },
}

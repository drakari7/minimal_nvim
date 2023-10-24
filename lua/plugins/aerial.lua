return {
  {
    'stevearc/aerial.nvim',
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    keys = {
      { "<leader>ao", function() require('aerial').toggle({ focus = false }) end, desc = 'Aerial toggle' },
      { "<leader>an", function() require('aerial').nav_toggle() end,           desc = 'Aerial nav toggle' },
      { "<leader>af", function() require('aerial').focus() end,                desc = 'Aerial focus' },
      { "<leader>ac", function() require('aerial').close_all() end,            desc = 'Aerial Close all' },
      { "]a",         function() require('aerial').next() end,                 desc = 'Aerial next' },
      { "[a",         function() require('aerial').prev() end,                 desc = 'Aerial prev' },
    },
    opts = {
      layout = {
        max_width = { 30, 0.16 },
        min_width = { 15, 0.1 },
      },

      close_automatic_events = { "unsupported" },
      show_guides = true,

      manage_folds = true,
      link_tree_to_folds = true,
      -- link_folds_to_tree = true,

      highlight_on_jump = false, -- Set a value in milliseconds or false to disable
      nav = {
        min_height = { 30, 0.6 },
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

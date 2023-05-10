local aerial = require('aerial')

aerial.setup({
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
})

vim.keymap.set('n', '<leader>ao', function() aerial.toggle{focus=false} end)
vim.keymap.set('n', '<leader>an', aerial.nav_toggle)
vim.keymap.set('n', '<leader>af', aerial.focus)
vim.keymap.set('n', ']a', aerial.next)
vim.keymap.set('n', '[a', aerial.prev)

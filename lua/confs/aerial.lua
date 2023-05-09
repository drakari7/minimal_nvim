require("aerial").setup({
  backends = { "treesitter", "markdown"},

  layout = {
    max_width = { 30, 0.16 },
    min_width = { 15, 0.1 },
    -- width = nil,
    default_direction = "prefer_right",
    placement = "window",
  },

  attach_mode = "global",

  close_automatic_events = {},

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
  -- icons = {},
  show_guides = true,
})


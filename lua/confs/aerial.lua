require("aerial").setup({
  backends = { "treesitter", "lsp", "markdown", "man" },

  layout = {
    max_width = { 40, 0.2 },
    min_width = { 20, 0.1 },
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
  icons = {},
  show_guides = true,
})


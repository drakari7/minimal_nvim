local map = require('confs.utils').map

return {
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  opts = {
    signs = true,
    merge_keywords = false,
    highlight = {
      multiline = false,
      keyword = "bg",
    }
  },

  config = function (_, opts)
    local tc = require("todo-comments")
    tc.setup(opts)

    map('n', ']t', tc.jump_next, 'Next todo comment')
    map('n', '[t', tc.jump_prev, 'Previous todo comment')
  end,
}

return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff view" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history (current file)" },
    { "<leader>gh", ":DiffviewFileHistory %<cr>", mode = 'x', desc = "Line history (visual selection)" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "File history (repo)" },
  },
}

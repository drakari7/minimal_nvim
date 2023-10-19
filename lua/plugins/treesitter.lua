return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ':TSUpdate',
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync" },
    opts = {
      ensure_installed = "all",
      highlight = { enable = true },
      indent = { enable = true },
    }
  }
}

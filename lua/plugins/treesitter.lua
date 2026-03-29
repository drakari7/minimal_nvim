return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    lazy = false,
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'lua',
        'bash',
        'c',
        'cpp',
        'rust',
        'python',
        'json',
        'meson',
        'norg',
        'vim',
        'csv',
        'toml',
        'markdown',
        'markdown_inline',
        'vimdoc',
        'yaml',
      },
      highlight = { enable = true },
      indent = { enable = true },
    }
  }
}

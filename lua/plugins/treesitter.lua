return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {"nvim-treesitter/nvim-treesitter-textobjects"},
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {'lua', 'bash', 'c', 'cpp', 'python', 'norg'},
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    }
  }
}

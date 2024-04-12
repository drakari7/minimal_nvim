return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {
        'lua',
        'bash',
        'c',
        'cpp',
        'python',
        'json',
        'meson',
        'norg',
        'vim',
        'csv',
        'toml',
        'markdown',
        'vimdoc',
      },
      sync_install = false,
      highlight = {
        enable = true,
        -- disable = function (lang, bufnr) -- Disable in files with more than 5k lines
        --   return vim.api.nvim_buf_line_count(bufnr) > 5000
        -- end
      },
      indent = { enable = true },
    }
  }
}

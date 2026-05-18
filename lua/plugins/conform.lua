return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd  = { 'ConformInfo' },
  opts = {
    formatters_by_ft = {
      python = { 'ruff_format' },
      lua    = { 'stylua' },
      sh     = { 'shfmt' },
      bash   = { 'shfmt' },
      -- json/yaml/toml/rust: fall back to LSP (lsp_format = 'fallback' below)
    },
    format_on_save = {
      timeout_ms = 1000,
      lsp_format = 'fallback',
    },
  },
  keys = {
    { 'gf', mode = { 'n', 'x' }, function()
      require('conform').format({ async = true, lsp_format = 'fallback' })
    end, desc = 'Format' },
  },
}

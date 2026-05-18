return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd   = { 'ConformInfo' },
  opts  = {
    formatters_by_ft = {
      python = { 'autoflake', 'isort', 'black' },
      lua    = { 'stylua' },
      sh     = { 'shfmt' },
      bash   = { 'shfmt' },
      rust   = { 'rustfmt' },
    },
    format_on_save = function(bufnr)
      local enable_fts = {
        rust = true,
      }
      if not enable_fts[vim.bo[bufnr].filetype] then
        return
      else
        return {
          timeout_ms = 1000,
          -- lsp_format = 'fallback'
        }
      end
    end,
  },
  keys  = {
    {
      'gf',
      mode = { 'n', 'x' },
      function() require('conform').format({ async = true }) end,
      desc = 'Format'
    },
  },
}

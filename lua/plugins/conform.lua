return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd   = { 'ConformInfo' },
  opts  = function()
    local pyproject_root = require('conform.util').root_file({ 'pyproject.toml' })
    return {
      formatters_by_ft = {
        python = { 'autoflake', 'isort', 'black' },
        lua    = { 'stylua' },
        sh     = { 'shfmt' },
        bash   = { 'shfmt' },
        rust   = { 'rustfmt' },
      },
      formatters = {
        autoflake = { cwd = pyproject_root },
        isort     = { cwd = pyproject_root },
        black     = { cwd = pyproject_root },
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
    }
  end,
  keys = {
    {
      'gf',
      mode = { 'n', 'x' },
      function() require('conform').format({ async = true }) end,
      desc = 'Format'
    },
  },
}

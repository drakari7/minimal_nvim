local border = {
  { "┌", "FloatBorder" },
  { "─", "FloatBorder" },
  { "┐", "FloatBorder" },
  { "│", "FloatBorder" },
  { "┘", "FloatBorder" },
  { "─", "FloatBorder" },
  { "└", "FloatBorder" },
  { "│", "FloatBorder" },
}

-- TODO: check if its possible to simplify this
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
}

local float_table = { float = { border = "rounded" } }

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neodev.nvim",                 opts = {} },
      { "williamboman/mason.nvim",           opts = {} },
      { "williamboman/mason-lspconfig.nvim", opts = { automatic_installation = true } },
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local map = require('confs.utils').map
      vim.diagnostic.config({
        signs = false,
        underline = true
      })
      map('n', '[d', function() vim.diagnostic.goto_prev(float_table) end, 'Prev diagnostic')
      map('n', ']d', function() vim.diagnostic.goto_next(float_table) end, 'Next diagnostic')
      map('n', '<leader>dl', vim.diagnostic.setloclist, 'Populate diagnostics in loclist')

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          map('n', 'gd', vim.lsp.buf.definition, 'Goto definition', opts)
          map('n', 'gr', vim.lsp.buf.references, 'LSP references', opts)
          map('n', 'K', vim.lsp.buf.hover, 'Hover', opts)
          map('n', '<leader>sr', vim.lsp.buf.rename, 'Rename symbol', opts)

          map({ 'n', 'v' }, 'gf', vim.lsp.buf.format, 'LSP Format', opts)
          map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, 'Code action', opts)

          map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, 'Add workspace folder', opts)
          map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Remove workspace folder', opts)
          map('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
            'List workspace folders', opts)

          map('n', '<leader>ls', '<cmd>LspStop<CR>', 'Stop LSP', opts)
          map('n', '<leader>lr', '<cmd>LspRestart<CR>', 'Restart LSP', opts)
        end,
      })

      local function on_attach(client, bufnr)
        client.server_capabilities.semanticTokensProvider = nil -- Disable semantic highlighting for now
      end

      local servers = {
        "pyright",
        "clangd",
        "bashls",
        "lua_ls",
      }

      -- capabilities from nvim cmp
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

      for _, lsp in ipairs(servers) do
        require('lspconfig')[lsp].setup({
          on_attach = on_attach,
          single_file_support = true,
          capabilities = capabilities,
          handlers = handlers,
        })
      end
    end
  }
}

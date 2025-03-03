return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/lazydev.nvim",      opts = {}, ft = "lua" },
      { "williamboman/mason.nvim", opts = {} },
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      local common_server_config = {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        on_attach = function(client, bufnr)
          client.server_capabilities.semanticTokensProvider = nil -- Disable semantic highlighting for now
        end,
      }

      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "ruff",
          "clangd",
          "bashls",
          "lua_ls",
          "jsonls",
          "mesonlsp",
          "taplo",
        },

        handlers = {
          -- Default handler
          function(server_name)
            require('lspconfig')[server_name].setup(common_server_config)
          end,

          -- Dedicated handler for a specific server
          -- ["ruff_lsp"] = function()
          --   require("lspconfig").ruff_lsp.setup({
          --     config = {}
          --   })
          -- end
        }

      })

      local map = require('confs.utils').map
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
      vim.diagnostic.config({
        signs = false,
        float = { border = "rounded" },
      })
      map('n', '[D', vim.diagnostic.goto_prev, 'Prev Error')
      map('n', ']D', vim.diagnostic.goto_next, 'Next Error')

      local severity = { severity = { min = vim.diagnostic.severity.WARN } }
      map('n', '[d', function() vim.diagnostic.goto_prev(severity) end, 'Prev diagnostic')
      map('n', ']d', function() vim.diagnostic.goto_next(severity) end, 'Next diagnostic')
      map('n', '<leader>dl', vim.diagnostic.setloclist, 'Populate diagnostics in loclist')

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          map('n', 'gd', vim.lsp.buf.definition, 'Goto definition', opts)
          map('n', 'gD', vim.lsp.buf.declaration, 'Goto declaration', opts)
          map('n', 'gi', vim.lsp.buf.implementation, 'Goto implementation', opts)
          map('n', 'go', vim.lsp.buf.type_definition, 'Goto type definition', opts)
          map('n', 'gr', vim.lsp.buf.references, 'LSP references', opts)
          map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename symbol', opts)

          map({ 'n', 'x' }, 'gf', function() vim.lsp.buf.format({ async = true }) end, 'LSP Format', opts)
          map('n', '<leader>ca', vim.lsp.buf.code_action, 'Code action', opts)

          -- Figure out how to actually use workspaces
          map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, 'Add workspace folder', opts)
          map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Remove workspace folder', opts)
          map('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
            'List workspace folders', opts)

          map('n', '<leader>ls', '<cmd>LspStop<CR>', 'Stop LSP', opts)
          map('n', '<leader>lr', '<cmd>LspRestart<CR>', 'Restart LSP', opts)
        end,
      })
    end
  }
}

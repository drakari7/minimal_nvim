return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/lazydev.nvim",      opts = {}, ft = "lua" }, -- For vim lua support with lsp
      { "williamboman/mason.nvim", opts = {} },
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      -- TODO: Not sure what this is exactly needed for, perhaps autopairs
      local common_server_config = {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      }

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          -- "ruff",
          "rust_analyzer",
          "bashls",
          "jsonls",
          "taplo",
        },

        handlers = {
          function(server_name)
            vim.lsp.config(server_name, common_server_config)
          end,

          -- TODO: check how to enable server specific options here
        }

      })

      local map = require('confs.utils').map

      vim.diagnostic.config({
        signs = false,
        float = { border = "rounded" },
        -- virtual_lines = { severity = { min = vim.diagnostic.severity.WARN } },
        jump = { on_jump = vim.diagnostic.open_float },
      })
      map('n', '[D', function() vim.diagnostic.jump({count=-1}) end, 'Prev Diagnostic')
      map('n', ']D', function() vim.diagnostic.jump({count= 1}) end, 'Next Diagnostic')

      local severity = { min = vim.diagnostic.severity.WARN }
      map('n', '[d', function() vim.diagnostic.jump({count=-1, severity=severity}) end, 'Prev error')
      map('n', ']d', function() vim.diagnostic.jump({count= 1, severity=severity}) end, 'Next error')
      map('n', '<leader>dl', vim.diagnostic.setloclist, 'Populate diagnostics in loclist')

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          map('n', 'gd', vim.lsp.buf.definition, 'Goto definition', opts)
          map('n', 'gD', vim.lsp.buf.declaration, 'Goto declaration', opts)
          map('n', 'go', vim.lsp.buf.type_definition, 'Goto type definition', opts)

          map('n', 'K', function() vim.lsp.buf.hover({ border = "rounded" }) end, 'Display Info', opts)

          map({ 'n', 'x' }, 'gf', function() vim.lsp.buf.format({ async = true }) end, 'LSP Format', opts)

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

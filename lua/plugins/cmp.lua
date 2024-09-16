return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    'hrsh7th/cmp-nvim-lua',
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },
  opts = function ()
    local cmp = require('cmp')
    return {
      -- preselect = cmp.PreselectMode.None,
      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-x>'] = cmp.mapping.abort(),
        -- EXPERIMENTAL
        ["<M-i>"] = cmp.mapping.select_next_item(),
        ["<M-o>"] = cmp.mapping.select_prev_item(),
        ['<M-CR>'] = cmp.mapping.confirm({ select = true }),
      }),

      sources = cmp.config.sources({
        { name = 'nvim_lsp', keyword_length = 2 },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua'},
        { name = 'neorg' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 2 },
      }),

      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },

      formatting = {
        format = function (entry, vim_item)
          vim_item.abbr = string.sub(vim_item.abbr, 1, 35)
          vim_item.menu = ({
            nvim_lua = "[API]",
            nvim_lsp = "[LSP]",
            nvim_lsp_signature_help = "[Sig]",
            path = "[Path]",
            buffer = "[Buf]",
          })[entry.source.name]

          return vim_item
        end
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    }
  end,
  config = function (_, opts)
    local cmp = require('cmp')
    cmp.setup(opts)

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources(
        {{ name = 'path' }},
        {{ name = 'cmdline', keyword_length = 2 }}
      ),
    })
  end,
}

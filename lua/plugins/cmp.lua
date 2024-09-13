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
  init = function ()
    vim.opt.completeopt = { "menu", "menuone", "noselect" }
  end,
  opts = function ()
    local cmp = require('cmp')
    return {
      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-x>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        -- TODO: instead of overloading tab, find a new keybinding
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, {'i', 's'}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, {'i', 's'}),
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
      matching = {}
    })
  end,
}

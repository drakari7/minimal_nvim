return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
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
      mapping = {
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-e>'] = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close(),}),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,
        ["<S-Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
      },

      sources = {
        { name = 'nvim_lsp', keyword_length = 2 },
        { name = 'nvim_lua'},
        { name = 'neorg' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 2 },
      },

      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          function(entry1, entry2)
            local _, entry1_under = entry1.completion_item.label:find "^_+"
            local _, entry2_under = entry2.completion_item.label:find "^_+"
            entry1_under = entry1_under or 0
            entry2_under = entry2_under or 0
            if entry1_under > entry2_under then
              return false
            elseif entry1_under < entry2_under then
              return true
            end
          end,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },

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
            path = "[Path]",
            buffer = "[Buf]",
          })[entry.source.name]

          return vim_item
        end
      },

      window = {
        documentation = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        }
      },
    }
  end,
  config = function (_, opts)
    local cmp = require('cmp')
    cmp.setup(opts)

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer', keyword_length = 2 }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({{ name = 'path' }}, {{ name = 'cmdline', keyword_length = 2 }})
    })
  end,
}

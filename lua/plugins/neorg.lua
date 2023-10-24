return {
  'nvim-neorg/neorg',
  build = ":Neorg sync-parsers",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-neorg/neorg-telescope',
  },
  lazy = false,
  keys = {
    {'<leader>ni', '<cmd>Neorg index<cr>', desc = "Neorg index file"}
  },
  opts = {
    load = {
      ['core.defaults'] = {},
      ['core.concealer'] = {},
      ['core.summary'] = {},
      ['core.integrations.telescope'] = {},
      ['core.completion'] = {
        config = {
          engine = 'nvim-cmp',
        }
      },
      ['core.dirman'] = {
        config = {
          workspaces = {
            notes = "~/notes"
          },
          default_workspace = 'notes',
        }
      },
    }
  },

}

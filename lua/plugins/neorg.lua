return {
  'nvim-neorg/neorg',
  version = "7.0.0",    -- TODO: Pinned to this version as 8.0.0 has breaking changes
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

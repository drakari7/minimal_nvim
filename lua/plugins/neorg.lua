return {
  'nvim-neorg/neorg',
  version = "*",
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
      ['core.keybinds'] = {},
      ['core.ui'] = {},
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

-- Trying to upgrade to 9.0.0
-- return {
--   "nvim-neorg/neorg",
--   lazy = false,
--   version = "*",
--   config = true
-- }

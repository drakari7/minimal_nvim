local neorg = require('neorg')

neorg.setup({
  load = {
    ['core.defaults'] = {},
    ['core.concealer'] = {},
    ['core.summary'] = {},
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
})

local map = require('confs.utils').map
map('n', '<leader>ni', '<cmd>Neorg index<cr>')

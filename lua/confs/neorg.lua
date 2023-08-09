local neorg = require('neorg')

neorg.setup({
  load = {
    ['core.defaults'] = {},
    ['core.concealer'] = {},
    ['core.dirman'] = {
      config = {
        workspaces = {
          notes = "~/notes"
        }
      }
    },
  }
})

local map = require('confs.utils').map
-- map('n', '')

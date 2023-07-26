local map = require('confs.utils').map

require('mini.bracketed').setup({
  diagnostic = { suffix = '' }
})


require('mini.surround').setup({
  mappings = {
    replace = 'sc', -- Replace surrounding
  },
})

require('mini.bufremove').setup()
map('n', '<leader>bd', require('mini.bufremove').delete, "Delete buffer")

require('mini.ai').setup()
require('mini.splitjoin').setup()
require('mini.comment').setup()

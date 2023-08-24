local map = require('confs.utils').map

require('mini.bracketed').setup({
  diagnostic = {suffix = ''},
  buffer = {suffix = ''}
})


require('mini.surround').setup({
  mappings = {
    replace = 'sc', -- Replace surrounding
  },
  search_method = 'cover'
})

require('mini.bufremove').setup()
map('n', '<leader>bd', require('mini.bufremove').delete, "Delete buffer")

require('mini.ai').setup()
require('mini.splitjoin').setup({
  mappings = {
    toggle = 'gs'
  }
})

require('mini.comment').setup()

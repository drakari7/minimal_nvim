local map = require('confs.utils').map

require('mini.bracketed').setup({
  diagnostic = { suffix = '' }
})

require('mini.bufremove').setup()
map('n', '<leader>bd', require('mini.bufremove').delete, "Delete buffer")



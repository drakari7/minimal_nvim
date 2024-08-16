local buf_map = require('confs.utils').buf_map
buf_map('n', '<leader>rr', ':w<CR>:!./%<CR>', 'Execute file')
buf_map('n', '<leader>ex', ':w<CR>:! chmod +x %<CR>', 'Make current file executable')

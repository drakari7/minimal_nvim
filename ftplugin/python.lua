local buf_map = require('confs.utils').buf_map
buf_map('n', '<leader>rr', ':w<CR>:!python3 %<CR>', 'Execute file')
buf_map('n', '<leader>pr', '^yt<space>oprint(<C-r>")<ESC>', 'Print variable')
buf_map('n', '<leader>di', 'viwoF,d', 'Delete import')

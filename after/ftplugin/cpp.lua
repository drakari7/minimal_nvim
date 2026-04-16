local buf_map = require('confs.utils').buf_map
buf_map('n', '<leader>rr', ':w<CR>:!~/random/colo_test_env/test.sh<CR>', 'Execute file')

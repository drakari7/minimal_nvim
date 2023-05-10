local map = require('confs.utils').map
local silent_opt = {silent = true}


-- Opening files (Move to startup plugin)
map('n', '<leader>no', ':e ~/notes/notes.md<CR>', 'Open notes')
map('n', '<leader>cm', ':e ~/prod-config/crypto_prod.main.py<CR>', 'Prod config')
map('n', '<leader>cb', ':e ~/master-config/crypto.beta.py<CR>', 'Prod config')

-- Quickfix and loclist
map('n', '<leader>lc', ':lclose<CR>', 'Close loclist')
map('n', '<leader>qc', ':cclose<CR>', 'Close quickfixlist')

-- Useful mappings
map('n', '<leader>qh', ':noh<CR>', 'Quiet highlight', silent_opt)
map('n', '<leader>nw', ':set wrap!<CR>', 'Toggle wrap', silent_opt)
map('n', '<leader>pr', '0hwyt<space>oprint(<C-r>")<ESC>', 'Print variable')
map('n', '<leader>hi', vim.show_pos, 'Inspect under cursor')
map('n', '<leader>sv', ':source $MYVIMRC<CR>', 'Source init.lua')
map('n', '<leader>st', ':% s#\\s\\+$##e<CR>:w<CR>', 'Strip trailing whitespace')
map('n', '<leader>ya', "mmggVGy'm", 'Yank entire file')
map('n', '<leader>cd', ':cd %:p:h<CR>', 'cd to current file dir')

-- Visual mode
map('v', '<leader>ct', ':!column -t<CR>gv>', 'Column table')
map('v', 'K', ":m '<-2<CR>gv=gv", 'Move line up')
map('v', 'J', ":m '>+1<CR>gv=gv", 'Move line down')

-- Misc
map({'n','v'}, '<leader>bh', '"_d', 'Blackhole register')
map('n', '<leader>cf', ':w<CR>:!clang-format -i %<CR><CR>', 'Run clang format')
map('n', '<leader>gb', ':Git blame<CR>', 'Git blame')   -- TODO: Move to a git plugin
map({'n','i'}, '<F1>', '<NOP>', 'Unmap F1')

-- Get git history of current and surrounding lines
-- local function get_line_git_history()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
-- end
-- vim.keymap.set("n", "<leader>gh", get_line_git_history)

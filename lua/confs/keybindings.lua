local map = require('confs.utils').map
local silent_opt = {silent = true}

-- Useful mappings
map('n', '<leader>qh', '<cmd>noh<CR>', 'Quiet highlight', silent_opt)
map('n', '<leader>nw', '<cmd>set wrap!<CR>', 'Toggle wrap', silent_opt)
map('n', '<leader>pr', '0hwyt<space>oprint(<C-r>")<ESC>', 'Print variable')
map('n', '<leader>hi', vim.show_pos, 'Inspect under cursor')
map('n', '<leader>sv', '<cmd>source $MYVIMRC<CR>', 'Source vimrc')
map('n', '<leader>so', '<cmd>source %<CR>', 'Source current file')
map('n', '<leader>st', '<cmd>% s#\\s\\+$##e<CR>:w<CR>', 'Strip trailing whitespace')
map('n', '<leader>ya', "mmggVGy'm", 'Yank entire file')
map('n', '<leader>cd', '<cmd>cd %:p:h<CR>', 'cd to current file dir')

-- Opening files (Move to startup plugin)
map('n', '<leader>sc', '<cmd>e ~/prod-config/crypto_prod.main.py<CR>', 'Prod config')
map('n', '<leader>mc', '<cmd>e ~/master-config/crypto.beta.py<CR>', 'Beta config')

-- Quickfix and loclist
map('n', '<leader>lc', '<cmd>lclose<CR>', 'Close loclist')
map('n', '<leader>qc', '<cmd>cclose<CR>', 'Close quickfixlist')

-- Visual mode
map('v', '<leader>ct', ':!column -t -o " "<CR>gv>', 'Column table')
map('v', 'K', ":m '<-2<CR>gv=gv", 'Move line up', silent_opt)
map('v', 'J', ":m '>+1<CR>gv=gv", 'Move line down', silent_opt)

-- Paste in quotes without overwriting yanked content
map('n', "<leader>pi'", "\"_di'hp")
map('n', '<leader>pi"', '"_di"hp')

-- Misc
map({'n','v'}, '<leader>bh', '"_d', 'Blackhole register')
map('n', '<leader>gb', '<cmd>Git blame<CR>', 'Git blame')   -- TODO: Move to a git plugin
map({'n','i'}, '<F1>', '<NOP>', 'Unmap F1')
map('n', '<leader>hw', "<cmd>let @/='\\<<C-R><C-W>\\>'<CR>:set hls<CR>", 'Highlight word under cursor')
-- map('v', '<leader>js', ":s/'/\"/g<CR>gv:s/False/false/g<CR>gv:s/True/true/g<CR>gv:s/None/null/g<CR>", "Convert to json")
-- map('v', '<leader>js', function ()
  -- vim.cmd("'<,'>s/'/\"/g")
  -- vim.cmd("'<,'>s/True/true/g")
  -- vim.cmd("'<,'>s/False/false/g")
  -- vim.cmd("'<,'>s/None/null/g")
-- end, "Convert to json")

-- map('v', '<leader>na', function ()
--   local vstart = vim.fn.getpos("'<")
--   local vend = vim.fn.getpos("'<")
--
--   local line_start = vstart[2]
--   local line_end = vend[2]
--
--   -- or use api.nvim_buf_get_lines
--   local lines = vim.fn.getline(line_start,line_end)
-- end, '')

-- Get git history of current and surrounding lines
-- local function get_line_git_history()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
-- end
-- vim.keymap.set("n", "<leader>gh", get_line_git_history)

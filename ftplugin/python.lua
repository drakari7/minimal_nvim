vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rr', ':w<CR>:!python3 %<CR>', {noremap=true, desc='Execute file'})

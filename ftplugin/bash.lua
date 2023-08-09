vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rr', ':w<CR>:!./%<CR>', {noremap=true, desc='Execute file'})

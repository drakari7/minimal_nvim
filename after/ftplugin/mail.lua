vim.opt_local.spell = true
vim.opt_local.spelllang = 'en_us'
vim.opt_local.fo:append('aw')
local options = { noremap = true, silent = true}
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>x', 'ZZ', options)

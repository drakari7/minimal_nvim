vim.loader.enable()
--------------------------------------------------------------
-- Sourcing config files
-----------------------------------------------------------

require('confs.options')
require('confs.keybindings')

require('confs.packer')
require('confs.aerial')
require('confs.tree_sitter')
require('confs.lsp_config')
require('confs.autopairs')
require('confs.cmp')
require('confs.gitsigns')
require('confs.which_key')
require('confs.nvimtree')
require('confs.lualine')
require('confs.toggleterm')
require('confs.luasnip')
require('confs.bufferline')
require('confs.telescope')
require('confs.colorizer')
require('confs.mini')
require('confs.alpha')
require('confs.misc')



vim.cmd([[
au FileType python  nnoremap <buffer> <leader>rr :w<CR>:!python3 %<CR>
au FileType cpp     nnoremap <buffer> <leader>rr :w<CR>:!source ~/scripts/gcc10_env && g++ -std=c++20 % && ./a.out<CR>
au FileType sh,bash nnoremap <buffer> <leader>rr :w<CR>:!./%<CR>

" Manually source at the end
colorscheme gruvbox
source ~/.config/nvim/after/colors.vim
source ~/.config/nvim/after/telescope_theme.vim
]])


-- Kill xsel on leaving an instance of neovim
vim.api.nvim_create_autocmd("VimLeave", {
    group = vim.api.nvim_create_augroup("KillXSel", {clear=true}),
    callback =  function()
        os.execute("killall xsel")
    end
})


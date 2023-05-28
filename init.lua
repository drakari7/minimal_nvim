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
au FileType cpp     nnoremap <buffer> <leader>rr :w<CR>:!g++ -std=c++20 % && ./a.out<CR>

"----------------------------------------------------------
" Plugin options
"----------------------------------------------------------
" Startify options
let g:startify_change_to_dir = 1
let g:startify_lists = [
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]
let g:startify_bookmarks = [
          \ { 'cv' : '~/.config/nvim/init.lua'},
          \ { 'ca' : '~/prod-config/subprojects/product_config/product_config_all.toml'},
          \ { 'cg' : '~/prod-config/subprojects/product_config/generators/generate_product_config.py'},
          \ { 'cm' : '~/prod-config/crypto_prod.main.py'},
          \ { 'cb' : '~/master-config/crypto.beta.py'},
          \ { 'cq' : '~/crypto/subprojects/config/prod.crypto_quoting.py'},
          \ { 'cs' : '~/crypto/subprojects/config/dev.shreyash.py'},
          \ { 'mf' : '~/scripts/my_funcs.sh'},
          \ { 'no' : '~/notes/notes.md'},
          \ { 'dq' : '~/notes/david_quotes.md'},
          \ { 'sp' : '~/notes/scratchpad.md'},
          \ { 'al' : '~/.config/zsh/aliasrc'},
          \ { 'zrc' : '~/.config/zsh/.zshrc'},
          \ { 'ss' : '~/.ssh/config'},
          \ { 'gc' : '~/.gitconfig'},
          \ { 'tc' : '~/random/test.cpp'},
          \ { 'tp' : '~/random/test.py'},
          \ { 'tb' : '~/random/test.sh'},
          \ { 'tm' : '~/.config/tmux/tmux.conf'},
          \ ]
"-----------------------------------------------------------
" Mappings for different plugins
"-----------------------------------------------------------
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


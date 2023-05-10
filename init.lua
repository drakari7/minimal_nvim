vim.loader.enable()
--------------------------------------------------------------
-- Sourcing config files
-----------------------------------------------------------

require('confs.options')
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
require('confs.misc')


vim.cmd([[
" Executing code from within nvim
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
" General purpose vim shortcuts
nnoremap <silent> <leader>qh :noh<CR>
nnoremap <leader>no :e ~/notes/notes.md<CR>
nnoremap <leader>lc :lclose<CR>
nnoremap <leader>qc :cclose<CR>
vnoremap <leader>bb "_d
nnoremap <leader>ya mmggVGy'm
nnoremap gb :ls<CR>:b<space>
nnoremap <leader>bd :Bd<CR>
nnoremap <leader>cd :cd %:p:h<CR>
nnoremap <leader>cr :cd ~/crypto/<CR>
nnoremap <leader>ps :PackerSync<CR>
nnoremap <leader>cf :w<CR>:!clang-format -i %<CR><CR>
nnoremap <leader>cs :e ~/crypto/subprojects/config/dev.shreyash.py<CR>
nnoremap <leader>cm :e ~/prod-config/crypto_prod.main.py<CR>
nnoremap <leader>ss :e ~/.ssh/config<CR>
nnoremap <leader>nw :set nowrap!<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>hi :Inspect<CR>
nnoremap <leader>rp' "_di'hp
nnoremap <leader>rp" "_di"hp
vnoremap <leader>ct :!column -t<CR>gv>
nnoremap <leader>pp 0hwyt<space>oprint(<C-r>")<ESC>
nnoremap <leader>sv :source $MYVIMRC<CR>

nmap <F1> <nop>
imap <F1> <nop>

" Move text around
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Shortcuts for file tree
nnoremap <leader>nn :NvimTreeToggle<CR>
nnoremap <leader>nr :NvimTreeRefresh<CR>

" Bufferline commands
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
nnoremap <silent>]b :BufferLineCycleNext<CR>
nnoremap <silent>[b :BufferLineCyclePrev<CR>

" Manually source at the end
colorscheme gruvbox
source ~/.config/nvim/after/colors.vim
source ~/.config/nvim/after/telescope_theme.vim
]])


-- Strip trailing whitespaces
vim.api.nvim_set_keymap("n", "<leader>st", ":% s#\\s\\+$##e<CR>:w<CR>", {silent = true, noremap = true})

-- Kill xsel on leaving an instance of neovim
vim.api.nvim_create_autocmd("VimLeave", {
    group = vim.api.nvim_create_augroup("KillXSel", { clear = true }),
    callback =  function()
        os.execute("killall xsel")
    end
})


-- Get git history of current and surrounding lines
-- local function get_line_git_history()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
-- end
-- vim.keymap.set("n", "<leader>gh", get_line_git_history)

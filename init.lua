vim.opt.termguicolors = true
--------------------------------------------------------------
-- Sourcing config files
-----------------------------------------------------------


require('confs.packer')
require('impatient')
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

-- Activate simple plugins
require('leap').add_default_mappings()
require('Comment').setup()
require('nvim-surround').setup()
require('indent_blankline').setup {
  -- show_current_context = true
}

vim.cmd([[

"------------------------------------------------------------
" Vim native options and settings
"------------------------------------------------------------
syntax enable
set clipboard=unnamedplus

" Some basic options
" TODO: lookup wildmenu
set number
set hidden
set whichwrap+=<,>,h,l,[,]
set cursorline
set ffs=unix,dos
set signcolumn=yes

" Tabs
set autoindent
set cindent
set asdasdasd wrap

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set breakindent
set linebreak
set showbreak=>

set encoding=utf-8 fileencoding=utf-8 fileformat=unix
set noshowmode
" set cursorline
set shortmess+=c
set ignorecase incsearch
set pumheight=15                " sets the pmenu height
set pumblend=10
set timeoutlen=1000
" set autochdir
set scrolloff=5
set splitbelow splitright       " split below instead of top
set conceallevel=0
" set textwidth=70

" listchars
set list
set lcs=
set lcs+=eol:¬
set lcs+=tab:»·
set lcs+=trail:·
set lcs+=extends:<
set lcs+=precedes:>
set lcs+=conceal:┊
set lcs+=nbsp:␣

" Setting leader keys
nnoremap <Space> <Nop>
let mapleader= " "
let maplocalleader = " "

" Mouse options
set mouse=

" Enable filetype plugins
filetype plugin indent on
"------------------------------------------------------------
" Language specific settings here
"------------------------------------------------------------
" Setting up python3 for neovim
let g:python3_host_prog = '/usr/local/bin/python3'

" Executing code from within nvim
au FileType python  nnoremap <buffer> <leader>rr :w<CR>:!python3 %<CR>
au FileType cpp     nnoremap <buffer> <leader>rr :w<CR>:!g++ -std=c++20 % && ./a.out<CR>

"----------------------------------------------------------
" Plugin options
"----------------------------------------------------------
" Symbol outline
nnoremap <silent> <leader>a :AerialToggle!<CR>

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
          \ { 'ca' : '~/prod-config/product_definitions/product_config_all.toml'},
          \ { 'cg' : '~/prod-config/product_definitions/generators/generate_product_config.py'},
          \ { 'cm' : '~/prod-config/crypto_prod.main.py'},
          \ { 'cb' : '~/master-config/crypto.beta.py'},
          \ { 'cq' : '~/crypto/subprojects/config/prod.crypto_quoting.py'},
          \ { 'cs' : '~/crypto/subprojects/config/dev.shreyash.py'},
          \ { 'mf' : '~/scripts/my_funcs.sh'},
          \ { 'no' : '~/notes/notes.md'},
          \ { 'dq' : '~/notes/david_quotes.md'},
          \ { 'sp': '~/notes/scratchpad.md'},
          \ { 'al' : '~/.config/zsh/aliasrc'},
          \ { 'zrc' : '~/.config/zsh/.zshrc'},
          \ { 'ss' : '~/.ssh/config'},
          \ { 'cg' : '~/.gitconfig'},
          \ { 'tc': '~/random/test.cpp'},
          \ { 'tp': '~/random/test.py'},
          \ { 'tb': '~/random/test.sh'},
          \ { 'tm': '~/.tmux.conf'},
          \ ]
"-----------------------------------------------------------
" Mappings for different plugins
"-----------------------------------------------------------
" General purpose vim shortcuts
nnoremap <silent> , :noh<CR>
nnoremap <leader>no :e ~/notes/notes.md<CR>
nnoremap <leader>lc :lclose<CR>
nnoremap <leader>qc :cclose<CR>
nnoremap <leader>bb "_d
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

" Telescope mappings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep path_display={"tail"}<cr>
nnoremap <leader>fw <cmd>Telescope grep_string<cr>
nnoremap <leader>bf <cmd>Telescope buffers<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope resume initial_mode=normal<cr>
nnoremap <leader>fa <cmd>Telescope aerial<cr>
nnoremap <leader>fv <cmd>lua require('confs.telescope').nvim_config_files()<CR>
nnoremap <leader>fs <cmd>lua require('confs.telescope').find_scripts()<CR>
nnoremap <leader>fc <cmd>Telescope current_buffer_fuzzy_find<CR>

" Manually source at the end
colorscheme gruvbox
source ~/.config/nvim/after/colors.vim
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

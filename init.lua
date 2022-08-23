vim.opt.termguicolors = true
--------------------------------------------------------------
-- Sourcing config files
-------------------------------------------------------------

require('confs.packer')
require('confs.tree_sitter')
require('confs.lsp_config')
require('confs.autopairs')
require('confs.cmp')
require('confs.symbols')
require('confs.lualine')
require('confs.bufferline')

vim.cmd([[
" For startup speed

"------------------------------------------------------------
" Vim native options and settings
"------------------------------------------------------------
syntax enable

" Some basic options
" TODO: lookup wildmenu, also shada
set number
set hidden
set whichwrap+=<,>,h,l,[,]

" Tabs
set autoindent
set cindent
set wrap

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
set clipboard+=unnamedplus
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
let mapleader= ","
let maplocalleader = ","

" Mouse options
set mouse=a
let g:is_mouse_enabled = 1

" Enable filetype plugins
filetype plugin indent on
"------------------------------------------------------------
" Language specific settings here
"------------------------------------------------------------
" Setting up python3 for neovim
" let g:python3_host_prog = '/usr/local/bin/python3'

" Executing code from within nvim
au FileType python  nnoremap <buffer> <leader>rr :w<CR>:!python3 %<CR>
"----------------------------------------------------------
" Plugin options
"----------------------------------------------------------
" Symbol outline
nnoremap <silent> <leader>ta :SymbolsOutline<CR>

" Startify options
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]
let g:startify_bookmarks = [
            \ {'c': '~/.config/nvim/init.lua'},
            \ {'n': '~/notes/todo.md'},
            \ {'tc': '~/random/test.cpp'},
            \ {'tp': '~/random/test.py'},
            \ ]
"-----------------------------------------------------------
" Mappings for different plugins
"-----------------------------------------------------------
" General purpose vim shortcuts
nnoremap <silent> <space> :noh<CR>
nnoremap <leader>lc :lclose<CR>
nnoremap <leader>qc :cclose<CR>
nnoremap <leader>bb "_d
vnoremap <leader>bb "_d
nnoremap <leader>ya mmggVGy'm
nnoremap gb :ls<CR>:b<space>
nnoremap <leader>bd :Bd<CR>
nnoremap <leader>cd :cd %:p:h<CR>

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
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>bf <cmd>Telescope buffers<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope resume<cr>
nnoremap <leader>fv <cmd>lua require('confs.telescope').nvim_config_files()<CR>
nnoremap <leader>fc <cmd>Telescope current_buffer_fuzzy_find<CR>

" Manually source at the end
source ~/.config/nvim/after/colors.vim
]])

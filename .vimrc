syntax on
set number

set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase
set hlsearch
set incsearch
colorscheme eldar

set textwidth=80
set wrap
set linebreak
set nolist

set lazyredraw

set splitright
set splitbelow

highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

set t_Co=256

set clipboard=unnamedplus

autocmd BufLeave * silent! wa

"execute pathogen#infect()
"call pathogen#helptags()
"filetype plugin indent on

"let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]

execute pathogen#infect()
syntax on
filetype plugin indent on
set nocompatible

" Настройки Vimwiki
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.syntax = 'markdown'
let wiki.ext = '.md'

let g:vimwiki_list = [wiki]
let g:vimwiki_global_ext = 0

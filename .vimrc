set nocompatible
filetype plugin indent on
execute pathogen#infect()
call pathogen#helptags()

" === Интерфейс ===
syntax on            " Подсветка синтаксиса
set number           " Номера строк
set t_Co=256         " 256 цветов отображения
colorscheme eldar

augroup CppmanCustom
    autocmd!
    autocmd FileType html
        \ if expand('<afile>:t') =~? 'cppman' |
        \   set filetype=cpp |
        \   colorscheme desert |
        \ endif
augroup END

augroup json_colors  " Цветовая схема под json
  autocmd!
  autocmd FileType json colorscheme desert256
augroup END

augroup md_colors  " Цветовая схема под md
  autocmd!
  autocmd FileType md colorscheme nightVision
augroup END

augroup cpp_colors  " Цветовая схема под json
  autocmd!
  autocmd FileType cpp,c  colorscheme print_bw
augroup END

" === Отступы/форматирование ===
set tabstop=2
set shiftwidth=2
set expandtab
set textwidth=95
set wrap
set linebreak
set nolist
"set colorcolumn=80

" === Поиск ===
set ignorecase
set smartcase
set hlsearch
set incsearch

" === Сплиты ===
set splitright
set splitbelow

" === Буфер и курсор ===
set lazyredraw
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

let &t_EI = "\e[1 q" " курсор-блок в NORMAL mode
let &t_SI = "\e[6 q" " курсор-вертикальная черта в INSERT mode

set clipboard=unnamedplus           " Глобальный буфер PRIMARY

autocmd BufLeave * silent! wa       " Автосохранение при выходе из буфера

"execute pathogen#infect()
"call pathogen#helptags()
"filetype plugin indent on

"let g:vimwiki_list = [{'path': '~/vimwiki/',
"                      \ 'syntax': 'markdown', 'ext': 'md'}]
"'}]

" === Настройки Vimwiki ===
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
let g:vimwiki_list = [wiki]
let g:vimwiki_global_ext = 0



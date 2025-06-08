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


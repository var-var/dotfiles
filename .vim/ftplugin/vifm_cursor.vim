" ~/.vim/after/plugin/vifm_cursor.vim
if $VIFM != ''
  augroup VifmCursor
    autocmd!
    autocmd VimEnter * let &t_EI = "\e[1 q"
    autocmd VimEnter * let &t_SI = "\e[6 q"
  augroup END
endif

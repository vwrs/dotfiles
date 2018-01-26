" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" checkers for each language
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_tex_checkers = ['']
" let g:syntastic_r_checkers = ['lintr']

" statusline
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

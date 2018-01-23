let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1
let g:tex_conceal=''

" remove spaces at the end of each line
function! Rstrip()
  let s:tmppos = getpos(".")
  if &filetype == "markdown"
    " >= 2 spaces -> 2 spaces, 1space -> delete
    %s/\v(\s{2})?(\s+)?$/\1/e
    match Underlined /\s\{2}$/
  else
    %s/\v\s+$//e
  endif
  call setpos(".", s:tmppos)
endfunction

" ensure the autocmd's are applied once
augroup configgroup
  autocmd!
  autocmd BufWritePre * :call Rstrip()
  autocmd FileType * setlocal formatoptions-=r
  autocmd FileType * setlocal formatoptions-=o
  " language-specific settings
  autocmd FileType python setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END
filetype plugin indent on


let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1
let g:tex_conceal=''
let g:large_file_size_threshold = 1024 * 1024
let g:large_file_line_threshold = 5000

" remove spaces at the end of each line
function! Rstrip()
  let s:tmppos = getpos('.')
  if &filetype ==? 'markdown'
    " >= 2 spaces -> 2 spaces, 1space -> delete
    %s/\v(\s{2})?(\s+)?$/\1/e
    match Underlined /\s\{2}$/
  else
    %s/\v\s+$//e
  endif
  call setpos('.', s:tmppos)
endfunction

function! s:OptimizeLargeFile() abort
  let l:path = expand('%:p')
  if empty(l:path) || !filereadable(l:path)
    return
  endif

  let l:filesize = getfsize(l:path)
  let l:linecount = line('$')
  if l:filesize <= g:large_file_size_threshold && l:linecount <= g:large_file_line_threshold
    return
  endif

  " Keep editing responsive for huge files using only native options.
  setlocal syntax=OFF
  setlocal synmaxcol=200
  let b:large_file_optimized = 1
endfunction

" ensure the autocmd's are applied once
augroup configgroup
  autocmd!
  autocmd BufWritePre * :call Rstrip()
  autocmd BufReadPost * call s:OptimizeLargeFile()
  autocmd BufWinEnter * call s:OptimizeLargeFile()
  autocmd FileType * setlocal formatoptions-=r
  autocmd FileType * setlocal formatoptions-=o
  autocmd FileType * call s:OptimizeLargeFile()
  " language-specific settings
  autocmd FileType python setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup END
filetype plugin indent on


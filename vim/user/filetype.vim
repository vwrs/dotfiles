let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1
let g:tex_conceal=''
let g:tex_flavor = 'latex'
let g:large_file_size_threshold = 1024 * 1024
let g:large_file_line_threshold = 5000

" remove spaces at the end of each line
function! Rstrip()
  let l:pos = getpos('.')
  if &filetype ==? 'markdown'
    " >= 2 spaces -> 2 spaces, 1space -> delete
    %s/\v(\s{2})?(\s+)?$/\1/e
  else
    %s/\v\s+$//e
  endif
  call setpos('.', l:pos)
endfunction

" highlight markdown line breaks (2 trailing spaces)
" matches are window-local, so reset it whenever a buffer is displayed.
" use matchadd() since :match is used by vim-trailing-whitespace.
function! s:HighlightMarkdownLineBreak() abort
  if exists('w:md_linebreak_match')
    silent! call matchdelete(w:md_linebreak_match)
    unlet w:md_linebreak_match
  endif
  if &filetype ==? 'markdown'
    " priority > 10 (:match) to take precedence over trailing-whitespace
    let w:md_linebreak_match = matchadd('Underlined', '\s\{2}$', 11)
  endif
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
  " run after syntax is set, which overrides changes made on BufReadPost/FileType
  autocmd BufWinEnter * call s:OptimizeLargeFile()
  autocmd BufWinEnter,FileType * call s:HighlightMarkdownLineBreak()
  autocmd FileType * setlocal formatoptions-=r
  autocmd FileType * setlocal formatoptions-=o
  " language-specific settings
  autocmd FileType terraform-vars setlocal commentstring=#\ %s
  " Enable omni completion.
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END
filetype plugin indent on


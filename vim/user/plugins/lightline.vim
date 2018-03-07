scriptencoding utf-8

" use lightline-buffer in lightline
let g:lightline = {
\ 'colorscheme': 'hydrangea',
\ 'active': {
\   'left': [ ['mode', 'paste' ],
\             ['fugitive', 'readonly', 'filename', 'modified'],
\           ],
\ },
\ 'tabline': {
\   'left': [ [ 'bufferinfo' ],
\             [ 'separator' ],
\             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
\   'right': [ [ 'close' ], ],
\ },
\ 'component_expand': {
\   'buffercurrent': 'lightline#buffer#buffercurrent',
\   'bufferbefore': 'lightline#buffer#bufferbefore',
\   'bufferafter': 'lightline#buffer#bufferafter',
\ },
\ 'component_type': {
\   'buffercurrent': 'tabsel',
\   'bufferbefore': 'raw',
\   'bufferafter': 'raw',
\ },
\ 'component_function': {
\   'bufferinfo': 'lightline#buffer#bufferinfo',
\   'fugitive':   'LightlineFugitive',
\ },
\ 'component': {
\   'separator': '',
\ },
\}

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
" ---------------------------------------------------
let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']

let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20

" custom tabline color
" :h lightline-colorscheme
" let s:p = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
" let s:p.tabline.middle = [ ['#81DAF5', 'Gray80', 255, 0] ]
" let g:lightline#colorscheme#{g:lightline.colorscheme}#palette = s:p

" functions
function! LightlineFugitive()
  if exists('*fugitive#head')
    let l:branch = fugitive#head()
    return l:branch !=# '' ? ' '.l:branch : ''
  endif
  return ''
endfunction

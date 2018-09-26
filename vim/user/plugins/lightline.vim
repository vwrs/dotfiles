scriptencoding utf-8

" use lightline-buffer in lightline
let g:lightline = {
\ 'colorscheme': 'hydrangea',
\ 'active': {
\   'left': [
\              ['mode', 'paste'],
\              ['fugitive', 'readonly', 'filename', 'modified'],
\           ],
\   'right': [
\              ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
\              ['lineinfo'],
\              ['percent'],
\              ['fileformat', 'fileencoding', 'filetype', 'charvaluehex'],
\            ]
\ },
\ 'tabline': {
\   'left': [
\             ['bufferinfo'],
\             ['separator_tab'],
\             ['bufferbefore', 'buffercurrent', 'bufferafter']
\           ],
\   'right': [['close']],
\ },
\ 'component_expand': {
\   'buffercurrent': 'lightline#buffer#buffercurrent',
\   'bufferbefore': 'lightline#buffer#bufferbefore',
\   'bufferafter': 'lightline#buffer#bufferafter',
\   'linter_checking': 'lightline#ale#checking',
\   'linter_warnings': 'lightline#ale#warnings',
\   'linter_errors': 'lightline#ale#errors',
\   'linter_ok': 'lightline#ale#ok',
\ },
\ 'component_type': {
\   'buffercurrent': 'tabsel',
\   'bufferbefore': 'raw',
\   'bufferafter': 'raw',
\   'linter_checking': 'left',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error',
\   'linter_ok': 'left',
\ },
\ 'component_function': {
\   'bufferinfo': 'lightline#buffer#bufferinfo',
\   'fugitive':   'LightlineFugitive',
\   'ale': 'LightlineALE',
\ },
\ 'component': {
\   'separator_tab': '',
\ },
\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
\}

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
" ---------------------------------------------------
let g:lightline_buffer_logo = "\ue62b "
let g:lightline_buffer_readonly_icon = "\ufafa"
let g:lightline_buffer_modified_icon = "\ufac1"
let g:lightline_buffer_git_icon = "\ue0a0 "
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

" lightline-ale
let g:lightline#ale#indicator_checking = " \uf110 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "

" custom tabline color
" :h lightline-colorscheme
" let s:p = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
" let s:p.tabline.middle = [ ['#81DAF5', 'Gray80', 255, 0] ]
" let g:lightline#colorscheme#{g:lightline.colorscheme}#palette = s:p

" fugitive
function! LightlineFugitive()
  if exists('*fugitive#head')
    let l:branch = fugitive#head()
    return l:branch !=# '' ? "\ue0a0 ".l:branch : ''
  endif
  return ''
endfunction


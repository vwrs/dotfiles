" neocomplete
" ----------
" TODO: remove later
" " Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
" " Use neocomplete.
" let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
" let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 2
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" " Define keyword.
" if !exists('g:neocomplete#keyword_patterns')
"     let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" " Enable heavy omni completion.
" if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
" endif
" " omni completion in TeX
" let g:neocomplete#sources#omni#input_patterns.tex =
"       \ '\v\\%('
"       \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
"       \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
"       \ . '|hyperref\s*\[[^]]*'
"       \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
"       \ . '|%(include%(only)?|input)\s*\{[^}]*'
"       \ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
"       \ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
"       \ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
"       \ . '|usepackage%(\s*\[[^]]*\])?\s*\{[^}]*'
"       \ . '|documentclass%(\s*\[[^]]*\])?\s*\{[^}]*'
"       \ . '|\a*'
"       \ . ')'
" " connect a dictionary file with filetype.
" let g:neocomplete#sources#dictionary#dictionaries = {
"   \ '_'   : '',
"   \ 'php' : '~/.vim/dict/PHP.dict',
"   \ 'tex' : '~/.vim/plugged/vim-latex/ftplugin/latex-suite/dictionaries/dictionary',
"   \}

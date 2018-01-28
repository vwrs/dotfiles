" basics
runtime! user/sets.vim

" key mappings
runtime! user/keymaps.vim

" language-specific settings
runtime! user/filetype.vim

" list of plugins
runtime! user/plugins.vim

" plugin-specific settings
runtime! user/plugins/*.vim

" colorscheme
" ----------
colorscheme hydrangea
set background=dark
syntax on
hi CursorLine cterm=underline,bold ctermfg=NONE ctermbg=NONE


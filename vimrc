" neovim
if has('nvim')
  set runtimepath^=~/.vim
  let &packpath = &runtimepath
endif

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
if has('nvim')
  runtime! user/plugins/*.lua
endif

" colorscheme
" ----------
syntax enable
" keep custom highlights after switching colorschemes
augroup custom_highlights
  autocmd!
  autocmd ColorScheme * hi CursorLine cterm=underline,bold ctermfg=NONE ctermbg=NONE
augroup END
" set background first; changing it later reloads the colorscheme
set background=dark
silent! colorscheme atom-dark

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

" macvim
if has('gui_macvim')
  set guifont=SauceCodePowerline-Semibold:h13
  set antialias
endif

" colorscheme
" ----------
colorscheme PaperColor
set background=dark
syntax on
hi CursorLine cterm=underline,bold ctermfg=NONE ctermbg=NONE


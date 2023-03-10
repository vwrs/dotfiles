" language-specific settings
" ----------
" vimtex
let g:vimtex_latexmk_continuous = 1
let g:tex_flavor = 'latex'
let g:vimtex_echo_ignore_wait = 1
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1
let g:vimtex_quickfix_open_on_warning = 0

" Nvim-R
let g:R_nvimpager='vertical'
let g:R_tmux_title='Nvim-R'
let g:R_source='$HOME/.vim/plugged/Nvim-R/R/tmux_split.vim'

" vim-cellmode
let g:cellmode_tmux_sessionname=''  " Will try to automatically pickup tmux session
let g:cellmode_tmux_windowname=''
let g:cellmode_tmux_panenumber='1'

" rust
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'
let g:racer_cmd = '$HOME/.cargo/bin/racer'

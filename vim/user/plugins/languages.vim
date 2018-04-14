scriptencoding utf-8

" Asynchronous Lint Engine
let g:ale_linters = {
    \ 'python': ['pycodestyle'],
    \}
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'

" language server
" ----------
" LanguageClient-neovim
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'r': ['R', '--quiet', '--slave', '-e', 'languageserver::run()'],
    \ }
let g:LanguageClient_diagnosticsDisplay = {
    \ 1: {
        \ 'name': 'Error',
        \ 'texthl': 'ALEError',
        \ 'signText': '✖',
        \ 'signTexthl': 'Error',
        \ },
    \ 2: {
        \ 'name': 'Warning',
        \ 'texthl': 'ALEWarning',
        \ 'signText': '⚠',
        \ 'signTexthl': 'ALEWarningSign',
        \ },
    \ 3: {
        \ 'name': 'Information',
        \ 'texthl': 'ALEInfo',
        \ 'signText': 'ℹ',
        \ 'signTexthl': 'ALEInfoSign',
        \ },
    \ 4: {
        \ 'name': 'Hint',
        \ 'texthl': 'ALEInfo',
        \ 'signText': '➤',
        \ 'signTexthl': 'ALEInfoSign',
        \ },
    \ }


" language-specific settings
" ----------
" jedi-vim
let g:jedi#documentation_command = 'K'
let g:jedi#goto_command = 'go'
" let g:jedi#goto_definitions_command = 'gd'
" let g:jedi#goto_assignments_command = 'ga'
" let g:jedi#completions_command = '<C-c>'
" let g:jedi#rename_command = '<C-d>r'

" vimtex
let g:vimtex_latexmk_continuous = 1
let g:tex_flavor = 'latex'
let g:vimtex_echo_ignore_wait = 1
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1

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


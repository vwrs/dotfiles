scriptencoding utf-8

" Asynchronous Lint Engine
" ruby: gem install rubocop
let g:ale_linters = {
  \ 'python': ['pycodestyle'],
  \ 'javascript': ['standard'],
  \ 'ruby': ['rubocop'],
  \ }
let g:ale_fixers = {
  \ 'javascript': ['standard'],
  \ }
let g:ale_sign_error = "\uf05e"
let g:ale_sign_warning = "\uf071"

" language server
" ----------
" LanguageClient-neovim
" vue: npm install -g vue-language-server
" ruby: gem install solargraph
let g:LanguageClient_serverCommands = {
  \ 'python': [],
  \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
  \ 'r': ['R', '--quiet', '--slave', '-e', 'languageserver::run()'],
  \ 'vue': ['vls'],
  \ 'javascript': [],
  \ 'html': [],
  \ 'ruby': [],
  \ }
let g:LanguageClient_diagnosticsDisplay = {
  \ 1: {
    \ 'name': 'Error',
    \ 'texthl': 'ALEError',
    \ 'signText':  "\uf05e",
    \ 'signTexthl': 'Error',
    \ },
  \ 2: {
    \ 'name': 'Warning',
    \ 'texthl': 'ALEWarning',
    \ 'signText':  "\uf071",
    \ 'signTexthl': 'ALEWarningSign',
    \ },
  \ 3: {
    \ 'name': 'Information',
    \ 'texthl': 'ALEInfo',
    \ 'signText': "\uf05a",
    \ 'signTexthl': 'ALEInfoSign',
    \ },
  \ 4: {
    \ 'name': 'Hint',
    \ 'texthl': 'ALEInfo',
    \ 'signText': "\uf05a",
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

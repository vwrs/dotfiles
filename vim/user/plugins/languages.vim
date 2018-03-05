" language server
" ----------
let g:lsp_signs_enabled = 1           " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
" python
" do `pip install python-language-server`
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif
" Rust
" do `rustup update; rustup component add rls-preview rust-analysis rust-src`
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

" language-specific settings
" ----------
" jedi-vim
let g:jedi#goto_command = "<Leader>g"
" let g:jedi#goto_assignments_command = "<Leader>g"
" let g:jedi#goto_definitions_command = "<Leader>d"
" let g:jedi#documentation_command = "K"
" let g:jedi#completions_command = "<C-c>"
" let g:jedi#rename_command = "<C-d>r"

" vimtex
let g:vimtex_latexmk_continuous = 1
let g:tex_flavor = 'latex'
let g:vimtex_echo_ignore_wait = 1
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1

" Nvim-R
let R_nvimpager='vertical'
let R_in_buffer=0
let R_applescript=0
let R_tmux_split=1
let R_term='tmux'

" vim-cellmode
let g:cellmode_tmux_sessionname=''  " Will try to automatically pickup tmux session
let g:cellmode_tmux_windowname=''
let g:cellmode_tmux_panenumber='1'

" rust
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'
let g:racer_cmd = '$HOME/.cargo/bin/racer'


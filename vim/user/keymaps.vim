let g:mapleader = "\<Space>"
let g:maplocalleader = "\<Space>"
" normal mode
" ------------
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap <ESC><ESC> :noh<CR>
noremap <C-j> <ESC>
noremap! <C-j> <ESC>
noremap <C-p> :bprev<CR>
noremap <C-n> :bnext<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
" highlight last inserted text
nnoremap gV `[v`]
" fzf
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>c :Commits<CR>
" caw.vim
nmap <C-/> <Plug>(caw:hatpos:toggle)
vmap <C-/> <Plug>(caw:hatpos:toggle)
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)
" nerdtree
nnoremap <Leader>n :NERDTree<CR>
" vim-fugitive
nnoremap <Leader>d :Gdiff<CR>
" vim-operator-replace
nmap R <Plug>(operator-replace)

" insert mode
" ------------
" emacs-like key mappings
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-p> <Up>
inoremap <silent> <C-n> <Down>
inoremap <silent> <C-a> <ESC>I
inoremap <silent> <C-e> <End>
inoremap <silent> <C-d> <Del>
" completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?

" command mode
" ------------
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>


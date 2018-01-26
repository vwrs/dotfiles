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
" fzf
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>c :Commits<CR>
" nerdtree
nnoremap <Leader>n :NERDTree<CR>
" vim-fugitive
nnoremap <Leader>d :Gdiff<CR>
" highlight last inserted text
nnoremap gV `[v`]

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

" command mode
" ------------
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>


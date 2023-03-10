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
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" highlight last inserted text
nnoremap gV `[v`]
" fuzzy finder
nnoremap <Leader>f <cmd>Telescope find_files<CR>
nnoremap <Leader>g <cmd>Telescope live_grep<CR>

" nnoremap <Leader>f :FZF<CR>
" nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>c :Commits<CR>
" caw.vim
nmap <C-/> <Plug>(caw:hatpos:toggle)
vmap <C-/> <Plug>(caw:hatpos:toggle)
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)
" nvim-tree
nnoremap <Leader>n :NvimTreeToggle<CR>
" vim-fugitive
nnoremap <Leader>d :Gdiff<CR>
" vim-operator-replace
nmap R <Plug>(operator-replace)
" LanguageClient-neovim
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" ALE
nmap <silent> <Leader>e <Plug>(ale_next_wrap)
nmap <silent> <Leader>E <Plug>(ale_previous_wrap)

" insert mode
" ------------
" emacs-like key mappings
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-f> <Right>
imap <silent> <C-p> <ESC>gka
imap <silent> <C-n> <ESC>gja
inoremap <silent> <C-a> <ESC>I
inoremap <silent> <C-e> <End>
inoremap <silent> <C-d> <Del>
" completion
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" vsnip
" expand
imap <expr> <C-l>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-l>'
smap <expr> <C-l>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-l>'
" Expand or jump
imap <expr> <C-k>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>'
smap <expr> <C-k>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>'
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" command mode
" ------------
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

" terminal mode
" ------------
if has('nvim')
  tnoremap <silent> <ESC> <C-\><C-n>
  " neoterm
  nnoremap <Leader>rq :Tclose<CR>
  nnoremap <Leader>rl :TREPLSendLine<CR>j0
  vnoremap <Leader>rl $:TREPLSendSelection<CR>'>j0
endif

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" vim-easymotion
" map <Leader> <Plug>(easymotion-prefix) " default: <Leader><Leader>
nmap <Leader><Leader>F <Plug>(easymotion-overwin-f)
nmap <Leader>s <Plug>(easymotion-overwin-f2)
nmap <Leader><Leader>W <Plug>(easymotion-overwin-w)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)

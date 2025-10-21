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
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>co :Commits<CR>
" caw.vim
nmap <C-/> <Plug>(comment_toggle_linewise_current)
vmap <C-/> <Plug>(comment_toggle_linewise_visual)
nmap <C-_> <Plug>(comment_toggle_linewise_current)
vmap <C-_> <Plug>(comment_toggle_linewise_visual)

" nvim-tree
nnoremap <Leader>n :NvimTreeToggle<CR>
" vim-fugitive
nnoremap <Leader>d :Gdiff<CR>
" vim-operator-replace
nmap R <Plug>(operator-replace)

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

" vsnip
" Expand or jump
imap <expr> <C-k>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>'
smap <expr> <C-k>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>'

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
nmap <Leader><Leader>F <Plug>(easymotion-overwin-f)
nmap <Leader>s <Plug>(easymotion-overwin-f2)
nmap <Leader><Leader>W <Plug>(easymotion-overwin-w)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)

" Copilot
imap <silent><script><expr> <C-H> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" Cursor
" Toggle the interactive terminal: Cursor Agent: Toggle terminal
nmap <Leader>ca :CursorAgent<CR>
" Ask about the visual selection:
vmap <Leader>ca :CursorAgentSelection<CR>
" Ask about the current buffer
nmap <Leader>cA :CursorAgentBuffer<CR>

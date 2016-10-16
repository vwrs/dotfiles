" set
" ----------
set enc=utf-8
set fenc=utf-8
" display
set title
set number
set ruler
set showmatch
set wrap
set cursorline
set cursorcolumn
set showcmd
" tab, indent
set list listchars=tab:\▸\-
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
" search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
" statusline
set laststatus=2
set statusline=[%n]
" show hostname
" set statusline+=%{matchstr(hostname(),'\\w\\+')}@
" set statusline+=%<%F
" set statusline+=%m
" set statusline+=%r
" set statusline+=%h
" set statusline+=%w
" set statusline+=[%{&fileformat}]
" set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
" set statusline+=%y
" set statusline+=%=
" set statusline+=[L=%l/%L]
" set statusline+=[%p%%]
" set statusline+=[RG=\"%{getreg()}\"]
" etc
set whichwrap=b,s,h,l,<,>,[,]
set filetype=on
set virtualedit=onemore
set nobackup
set noswapfile
set wildmode=list:longest
set clipboard=unnamed,autoselect
" map
" ----------
nnoremap j gj
nnoremap k gk
nnoremap <ESC><ESC> :noh<CR>
noremap <C-j> <ESC>
noremap! <C-j> <ESC>
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)
" autocomp palenthesis
"inoremap { {}<Left>
"inoremap {<Enter> {}<Left><CR><ESC><S-o>
"inoremap ( ()<ESC>
"inoremap (<Enter> ()<Left><CR><ESC><S-o>
" autocmd
" ----------
autocmd BufWritePre * :%s/\s\+$//ge
" syntax
" ----------
colorscheme onedark
syntax on
"
" -----
" vim-plug
" ----------
" --------------------
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" general
" ----------
Plug 'junegunn/vim-easy-align'
Plug 'tyru/caw.vim'
Plug 'bling/vim-airline'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" on-demand
" ----------
Plug 'junegunn/fzf', { 'on': 'FZFToggle', 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'shougo/unite.vim', { 'on': 'UniteToggle' }
Plug 'ujihisa/unite-colorscheme', { 'on': 'UniteToggle' }
" programming languages
" ----------
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'valloric/youcompleteme', { 'for': ['c', 'cpp'] }
Plug 'pangloss/vim-javascript', { 'for': ['html', 'javascript', 'php'] }
Plug 'stanangeloff/php.vim', { 'for': 'php' }
" colorscheme
" ----------
Plug 'altercation/vim-colors-solarized', { 'do': 'ln -fnsv ~/.vim/plugged/vim-colors-solarized/colors/* ~/.vim/colors' }
Plug 'tomasr/molokai', { 'do': 'ln -fnsv ~/.vim/plugged/molokai/colors/* ~/.vim/colors' }
Plug 'w0ng/vim-hybrid', { 'do': 'ln -fnsv ~/.vim/plugged/vim-hybrid/colors/* ~/.vim/colors' }
Plug 'gosukiwi/vim-atom-dark', { 'do': 'ln -fnsv ~/.vim/plugged/vim-atom-dark/colors/* ~/.vim/colors' }
Plug 'joshdick/onedark.vim', { 'do': 'ln -fnsv ~/.vim/plugged/onedark.vim/colors/* ~/.vim/colors' }
Plug 'jacoborus/tender.vim', { 'do': 'ln -fnsv ~/.vim/plugged/tender.vim/colors/* ~/.vim/colors' }
call plug#end()

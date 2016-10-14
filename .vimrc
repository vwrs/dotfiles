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
" etc
set whichwrap=b,s,h,l,<,>,[,]
set filetype=on
set virtualedit=onemore
set nobackup
set noswapfile
set wildmode=list:longest
set clipboard=unnamed,autoselect
" map
nnoremap j gj
nnoremap k gk
nnoremap <ESC><ESC> :noh<CR>
"inoremap { {}<Left>
"inoremap {<Enter> {}<Left><CR><ESC><S-o>
"inoremap ( ()<ESC>
"inoremap (<Enter> ()<Left><CR><ESC><S-o>
" statusline
set laststatus=2
set statusline=[%n]
" show hostname
"set statusline+=%{matchstr(hostname(),'\\w\\+')}@
set statusline+=%<%F
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%w
set statusline+=[%{&fileformat}]
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
set statusline+=%y
set statusline+=%=
set statusline+=[L=%l/%L]
set statusline+=[%p%%]
set statusline+=[RG=\"%{getreg()}\"]

" syntax
colorscheme molokai
syntax on

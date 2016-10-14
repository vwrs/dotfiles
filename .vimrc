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
set laststatus=2
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
" syntax
colorscheme molokai
syntax on

set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

" display
set title
set number
set ruler
set showmatch
set wrap
set cursorline
" set cursorcolumn
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
set showtabline=2
set laststatus=2
" etc
set whichwrap=b,s,h,l,<,>,[,]
set filetype=on
set virtualedit=onemore
set nobackup
set noswapfile
set wildmenu
set wildmode=list:longest
set backspace=indent,eol,start
set clipboard=unnamed
set mouse=a
set t_ut=
set t_Co=256
set scrolloff=10
set colorcolumn=80
set conceallevel=0
set hidden  " allow buffer switching without saving

if has('nvim')
  set inccommand=nosplit
  set termguicolors
endif


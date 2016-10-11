" set
" ----------
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
" tab
set list listchars=tab:\▸\-
set expandtab
set tabstop=2
set shiftwidth=2
" search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
" etc
set virtualedit=onemore
set smartindent
set nobackup
set noswapfile
set wildmode=list:longest
if has('gui') || has('xterm_clipboard')
  set clipboard=unnamed
endif
" map
nnoremap j gj
nnoremap k gk
" syntax
colorscheme molokai
syntax on

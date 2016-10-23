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
set laststatus=2
" set statusline=[%n]
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
set backspace=indent,eol,start
" map
" ----------
let mapleader="\<Space>"
nnoremap j gj
nnoremap k gk
nnoremap <ESC><ESC> :noh<CR>
noremap <Leader>j <ESC>
noremap! <Leader>j <ESC>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)
" autocomp palenthesis
"inoremap { {}<Left>
"inoremap {<Enter> {}<Left><CR><ESC><S-o>
"inoremap ( ()<ESC>
"inoremap (<Enter> ()<Left><CR><ESC><S-o>
" autocmd
" ----------
autocmd BufWritePre * :%s/\s\+$//ge " remove spaces at the end of line
autocmd FileType * setlocal formatoptions-=r
autocmd FileType * setlocal formatoptions-=o
" syntax
" ----------
colorscheme tender
set background=dark
syntax on
" plugins
" ----------
" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='tenderplus'
let g:airline#extensions#tabline#enabled=1
let g:airline_enable_branch = 1
" youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_keep_logfiles=1
let g:ycm_server_log_level='debug'
let g:ycm_semantic_triggers = { 'tex' : ['\ref{', '\cite{'] }
let g:ycm_python_binary_path = 'python'
" vimtex
let g:tex_flavor='latex'
" ultisnips
let g:UltiSnipsExpandTrigger="<C-,>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
" jedi-vim
let g:jedi#goto_command = "<Leader>d"
" let g:jedi#goto_assignments_command = "<Leader>g"
" let g:jedi#goto_definitions_command = "<Leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<Leader>u"
let g:jedi#completions_command = "<Leader>c"
let g:jedi#rename_command = "<Leader>r"
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bronson/vim-trailing-whitespace'
Plug 'wakatime/vim-wakatime'
Plug 'shougo/unite.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Toggle
" ----------
Plug 'junegunn/fzf', { 'on': 'FZFToggle', 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ujihisa/unite-colorscheme', { 'on': 'ColorschemeToggle' }
" programming languages
" ----------
"  FIXME: python in youcompleteme
Plug 'valloric/youcompleteme', { 'for': ['c', 'cpp', 'html', 'php', 'javascript', 'rust'], 'on': 'YCMToggle'  }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'bjoernd/vim-ycm-tex', { 'for': 'tex' }
Plug 'pangloss/vim-javascript', { 'for': ['html', 'javascript', 'php'] }
Plug 'stanangeloff/php.vim', { 'for': 'php' }
Plug 'evidens/vim-twig', { 'for': 'twig' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" colorscheme
" ----------
Plug 'altercation/vim-colors-solarized', { 'do': 'ln -fnsv ~/.vim/plugged/vim-colors-solarized/colors/* ~/.vim/colors' }
Plug 'tomasr/molokai', { 'do': 'ln -fnsv ~/.vim/plugged/molokai/colors/* ~/.vim/colors' }
Plug 'w0ng/vim-hybrid', { 'do': 'ln -fnsv ~/.vim/plugged/vim-hybrid/colors/* ~/.vim/colors' }
Plug 'gosukiwi/vim-atom-dark', { 'do': 'ln -fnsv ~/.vim/plugged/vim-atom-dark/colors/* ~/.vim/colors' }
Plug 'joshdick/onedark.vim', { 'do': 'ln -fnsv ~/.vim/plugged/onedark.vim/colors/* ~/.vim/colors' }
Plug 'jacoborus/tender.vim', { 'do': 'ln -fnsv ~/.vim/plugged/tender.vim/colors/* ~/.vim/colors' }
call plug#end()

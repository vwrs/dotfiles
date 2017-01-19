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
set backspace=indent,eol,start
set clipboard=unnamed
set mouse=a
" syntax
" ----------
colorscheme atom-dark-256
set background=dark
syntax on
" autocmd
" ----------
autocmd BufWritePre * :%s/\s\+$//ge " remove spaces at the end of line
autocmd FileType * setlocal formatoptions-=r
autocmd FileType * setlocal formatoptions-=o
filetype plugin indent on
" programming languages
" ----------
autocmd FileType python setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1

" key-mappings
" ----------
let mapleader = "\<Space>"
nnoremap j gj
nnoremap k gk
" noremap <S-h>   ^
" noremap <S-j> <S-l>
" noremap <S-k> <S-h>
" noremap <S-l>   $
nnoremap <ESC><ESC> :noh<CR>
noremap <C-j> <ESC>
noremap! <C-j> <ESC>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
" autocomp palenthesis
"inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
"inoremap ( ()<ESC>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" plugin settings
" ----------
" ---------------
" neocomplete
" ----------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
" connect a dictionary file with filetype.
let g:neocomplete#sources#dictionary#dictionaries = {
  \ '_'   : '',
  \ 'php' : '~/.vim/dict/PHP.dict',
  \ 'tex' : '~/.vim/plugged/vim-latex/ftplugin/latex-suite/dictionaries/dictionary',
  \}
" for vim-R-plugin
let g:neocomplete#sources#omni#input_patterns.r = '[[:alnum:].\\]\+'
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" neosnippets
" ----------
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory = '~/.vim/plugged/vim-snippets/snippets'

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_tex_checkers = ['']
" let g:syntastic_r_checkers = ['lintr']
" let g:syntastic_enable_r_lintr_checker = 1

" vim-latex
" replace C-J to C-K in ~/.vim/plugged/vim-latex/plugin/imaps.vim
" or set g:Imap_UsePlaceHolders to 0.
let g:Imap_UsePlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_ViewRule_pdf = 'open -a Preview.app'

" vimtex
let g:vimtex_latexmk_continuous = 1
let g:tex_flavor = 'latex'
let g:vimtex_echo_ignore_wait = 1
" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='tenderplus'
let g:airline#extensions#tabline#enabled=1
let g:airline_enable_branch = 1
" jedi-vim
let g:jedi#goto_command = "<C-d>d"
" let g:jedi#goto_assignments_command = "<Leader>g"
" let g:jedi#goto_definitions_command = "<Leader>d"
let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<Leader>u"
let g:jedi#completions_command = "<C-c>"
let g:jedi#rename_command = "<C-d>r"
" vim-indent-guides
let g:indent_guides_start_level = 2
" closetag.vim
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
" caw.vim
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)
" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim-plug
" ----------
" ---------------
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" always
" ----------
Plug 'junegunn/vim-easy-align'
Plug 'tyru/caw.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bronson/vim-trailing-whitespace'
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'
Plug 'honza/vim-snippets'
Plug 'shougo/unite.vim'
Plug 'scrooloose/nerdtree'
" Toggle
" ----------
Plug 'vim-syntastic/syntastic', { 'on': 'SyntasticToggle' }
Plug 'ujihisa/unite-colorscheme', { 'on': 'ColorschemeToggle' }
" programming languages
" ----------
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'vim-latex/vim-latex', { 'for': 'tex' }
Plug 'pangloss/vim-javascript', { 'for': ['html', 'javascript', 'php'] }
Plug 'stanangeloff/php.vim', { 'for': 'php' }
Plug 'evidens/vim-twig', { 'for': 'twig' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'tpope/vim-dispatch', { 'on': 'LaravelToggle' }
Plug 'tpope/vim-projectionist', { 'on': 'LaravelToggle' }
Plug 'noahfrederick/vim-composer', { 'on': 'LaravelToggle' }
Plug 'noahfrederick/vim-laravel', { 'on': 'LaravelToggle' }
Plug 'jalvesaq/Nvim-R', { 'for': 'r' }
Plug 'alvan/vim-closetag', { 'for': ['html', 'php', 'twig'] }
" colorscheme
" ----------
Plug 'altercation/vim-colors-solarized', { 'do': 'ln -fnsv ~/.vim/plugged/vim-colors-solarized/colors/* ~/.vim/colors' }
Plug 'tomasr/molokai', { 'do': 'ln -fnsv ~/.vim/plugged/molokai/colors/* ~/.vim/colors' }
Plug 'w0ng/vim-hybrid', { 'do': 'ln -fnsv ~/.vim/plugged/vim-hybrid/colors/* ~/.vim/colors' }
Plug 'gosukiwi/vim-atom-dark', { 'do': 'ln -fnsv ~/.vim/plugged/vim-atom-dark/colors/* ~/.vim/colors' }
Plug 'joshdick/onedark.vim', { 'do': 'ln -fnsv ~/.vim/plugged/onedark.vim/colors/* ~/.vim/colors' }
Plug 'jacoborus/tender.vim', { 'do': 'ln -fnsv ~/.vim/plugged/tender.vim/colors/* ~/.vim/colors' }
call plug#end()

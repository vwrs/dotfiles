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
" fold
" set foldenable
" set foldmethod=indent
" set foldlevelstart=0
" set foldnestmax=3
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
set scrolloff=10
set colorcolumn=80

" ensure the autocmd's are applied once
augroup configgroup
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//ge " remove spaces at the end of line
  autocmd FileType * setlocal formatoptions-=r
  autocmd FileType * setlocal formatoptions-=o
  " language-specific settings
  autocmd FileType python setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END
filetype plugin indent on

" language-specific settings
" ----------
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1
let g:tex_conceal=''

" change default key mappings
" ----------
let g:mapleader = "\<Space>"
let g:maplocalleader = "\<Space>"
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap <ESC><ESC> :noh<CR>
noremap <C-j> <ESC>
noremap! <C-j> <ESC>
" inoremap jk <ESC>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
" highlight last inserted text
nnoremap gV `[v`]
" emacs-like key mappings
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-p> <Up>
inoremap <silent> <C-n> <Down>
inoremap <silent> <C-a> <ESC>I
inoremap <silent> <C-e> <End>
inoremap <silent> <C-d> <Del>

" plugin settings
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
" omni completion in TeX
let g:neocomplete#sources#omni#input_patterns.tex =
      \ '\v\\%('
      \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
      \ . '|hyperref\s*\[[^]]*'
      \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|%(include%(only)?|input)\s*\{[^}]*'
      \ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|usepackage%(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|documentclass%(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|\a*'
      \ . ')'
" connect a dictionary file with filetype.
let g:neocomplete#sources#dictionary#dictionaries = {
  \ '_'   : '',
  \ 'php' : '~/.vim/dict/PHP.dict',
  \ 'tex' : '~/.vim/plugged/vim-latex/ftplugin/latex-suite/dictionaries/dictionary',
  \}
let g:neocomplete#sources#omni#input_patterns.r = '[[:alnum:].\\]\+'
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

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='tenderplus'
let g:airline#extensions#tabline#enabled=1
let g:airline_enable_branch = 1

" vim-indent-guides
let g:indent_guides_start_level = 2

" closetag.vim
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.twig"

" caw.vim
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" nerdtree
nnoremap <Leader>n :NERDTree<CR>
" vim-fugitive
nnoremap <Leader>d :Gdiff<CR>
" fzf
nnoremap <Leader>f :FZF<CR>
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,css,r,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor,cache}/*" '
command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Customize fzf colors to match your color scheme
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

" vim-easymotion
" map <Leader> <Plug>(easymotion-prefix) " default: <Leader><Leader>
map  <Leader><Leader>F <Plug>(easymotion-bd-f)
nmap <Leader><Leader>F <Plug>(easymotion-overwin-f)
nmap <Leader>s <Plug>(easymotion-overwin-f2)
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
map  <Leader><Leader>W <Plug>(easymotion-bd-w)
nmap <Leader><Leader>W <Plug>(easymotion-overwin-w)
" map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1

" vim-operator-replace
nmap R <Plug>(operator-replace)

" language-specific plugins
" ----------
" jedi-vim
let g:jedi#goto_command = "<Leader>g"
" let g:jedi#goto_assignments_command = "<Leader>g"
" let g:jedi#goto_definitions_command = "<Leader>d"
let g:jedi#documentation_command = "K"
" let g:jedi#completions_command = "<C-c>"
let g:jedi#rename_command = "<C-d>r"

" vimtex
let g:vimtex_latexmk_continuous = 1
let g:tex_flavor = 'latex'
let g:vimtex_echo_ignore_wait = 1
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1

" Nvim-R
let R_nvimpager='vertical'
let R_in_buffer=0
let R_applescript=0
let R_tmux_split=1
let R_term='tmux'

" vim-cellmode
let g:cellmode_screen_sessionname='jupyter'
let g:cellmode_tmux_panenumber='1'

" vim-plug
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
Plug 'tpope/vim-sleuth'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'honza/vim-snippets'
Plug 'shougo/unite.vim'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'kana/vim-smartinput'
Plug 'tpope/vim-surround'
" textobj
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-datetime'
Plug 'kana/vim-textobj-indent'
Plug 'thinca/vim-textobj-comment'
Plug 'thinca/vim-textobj-between'
Plug 'rhysd/vim-textobj-anyblock'
" operator
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
" Toggle
" ----------
Plug 'vim-syntastic/syntastic', { 'on': 'SyntasticToggle' }
Plug 'ujihisa/unite-colorscheme', { 'on': 'ColorschemeToggle' }
" programming languages
" ----------
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'pangloss/vim-javascript', { 'for': ['html', 'javascript', 'php'] }
Plug 'stanangeloff/php.vim', { 'for': 'php' }
Plug 'lumiliet/vim-twig', { 'for': 'twig' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'noahfrederick/vim-laravel', { 'on': 'LaravelToggle' }
Plug 'jalvesaq/Nvim-R', { 'for': 'r' }
Plug 'alvan/vim-closetag', { 'for': ['html', 'php', 'twig'] }
Plug 'vim-scripts/matchit.zip' ", { 'for': ['html', 'php', 'twig'] }
Plug 'julienr/vim-cellmode', { 'for': 'python' }
" colorscheme
" ----------
" Plug 'altercation/vim-colors-solarized', { 'do': 'ln -fnsv ~/.vim/plugged/vim-colors-solarized/colors/* ~/.vim/colors' }
Plug 'tomasr/molokai', { 'do': 'ln -fnsv ~/.vim/plugged/molokai/colors/* ~/.vim/colors' }
Plug 'w0ng/vim-hybrid', { 'do': 'ln -fnsv ~/.vim/plugged/vim-hybrid/colors/* ~/.vim/colors' }
Plug 'gosukiwi/vim-atom-dark', { 'do': 'ln -fnsv ~/.vim/plugged/vim-atom-dark/colors/* ~/.vim/colors' }
Plug 'joshdick/onedark.vim', { 'do': 'ln -fnsv ~/.vim/plugged/onedark.vim/colors/* ~/.vim/colors' }
Plug 'jacoborus/tender.vim', { 'do': 'ln -fnsv ~/.vim/plugged/tender.vim/colors/* ~/.vim/colors' }
" Plug '29decibel/codeschool-vim-theme', { 'do': 'ln -fnsv ~/.vim/plugged/codeschool-vim-theme/colors/* ~/.vim/colors' }
" Plug 'vim-scripts/twilight', { 'do': 'ln -fnsv ~/.vim/plugged/twilight/colors/* ~/.vim/colors' }
" Plug 'vim-scripts/phd', { 'do': 'ln -fnsv ~/.vim/plugged/phd/colors/* ~/.vim/colors' }
Plug 'ciaranm/inkpot', { 'do': 'ln -fnsv ~/.vim/plugged/inkpot/colors/* ~/.vim/colors' }
call plug#end()

" syntax
" ----------
colorscheme inkpot
set background=dark
syntax on
hi CursorLine cterm=underline,bold ctermfg=NONE ctermbg=NONE


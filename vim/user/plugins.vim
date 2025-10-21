" vim-plug
" ---------------
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" utils
" ----------
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'amrbashir/nvim-docs-view', { 'on': 'DocsViewToggle'}
Plug 'folke/trouble.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'MunifTanjim/nui.nvim'
Plug 'folke/noice.nvim'

Plug 'tpope/vim-sleuth'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-smartinput'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bronson/vim-trailing-whitespace'
Plug 'kassio/neoterm'
Plug 'unblevable/quick-scope'

" completion
" ----------
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'
" lsp
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'  " formatter & linter
" AI
Plug 'github/copilot.vim'
Plug 'xTacobaco/cursor-agent.nvim'

" textobj
" ----------
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-datetime'
Plug 'kana/vim-textobj-indent'
Plug 'thinca/vim-textobj-comment'
Plug 'thinca/vim-textobj-between'
Plug 'rhysd/vim-textobj-anyblock'
" operator
" ----------
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'

" language-specific
" ----------
" syntax highlighting
" {'do': 'cargo install tree-sitter-cli'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'tell-k/vim-autopep8', { 'for': 'python' }
Plug 'jalvesaq/Nvim-R', { 'for': 'r' }
Plug 'alvan/vim-closetag', { 'for': ['html', 'php', 'twig'] }
Plug 'keith/tmux.vim', { 'for': 'tmux'}
Plug 'cespare/vim-toml'

" colorscheme
" ----------
Plug 'EdenEast/nightfox.nvim'
Plug 'altercation/vim-colors-solarized', {
    \ 'do': 'ln -fnsv ~/.vim/plugged/vim-colors-solarized/colors/* ~/.vim/colors',
    \ 'on': 'NeverToggle'
    \ }
Plug 'tomasr/molokai', {
    \ 'do': 'ln -fnsv ~/.vim/plugged/molokai/colors/* ~/.vim/colors',
    \ 'on': 'NeverToggle'
    \ }
Plug 'w0ng/vim-hybrid', {
    \ 'do': 'ln -fnsv ~/.vim/plugged/vim-hybrid/colors/* ~/.vim/colors',
    \ 'on': 'NeverToggle'
    \ }
Plug 'gosukiwi/vim-atom-dark', {
    \ 'do': 'ln -fnsv ~/.vim/plugged/vim-atom-dark/colors/* ~/.vim/colors',
    \ 'on': 'NeverToggle'
    \ }
Plug 'joshdick/onedark.vim', {
    \ 'do': 'ln -fnsv ~/.vim/plugged/onedark.vim/colors/* ~/.vim/colors',
    \ 'on': 'NeverToggle'
    \ }
Plug 'jacoborus/tender.vim', {
    \ 'do': 'ln -fnsv ~/.vim/plugged/tender.vim/colors/* ~/.vim/colors',
    \ 'on': 'NeverToggle'
    \ }
Plug '29decibel/codeschool-vim-theme', {
    \ 'do': 'ln -fnsv ~/.vim/plugged/codeschool-vim-theme/colors/* ~/.vim/colors',
    \ 'on': 'NeverToggle'
    \ }
Plug 'vim-scripts/twilight', {
    \ 'do': 'ln -fnsv ~/.vim/plugged/twilight/colors/* ~/.vim/colors',
    \ 'on': 'NeverToggle'
    \ }
Plug 'vim-scripts/phd', {
    \ 'do': 'ln -fnsv ~/.vim/plugged/phd/colors/* ~/.vim/colors',
    \ 'on': 'NeverToggle'
    \ }
Plug 'ciaranm/inkpot', {
    \ 'do': 'ln -fnsv ~/.vim/plugged/inkpot/colors/* ~/.vim/colors',
    \ 'on': 'NeverToggle'
    \ }
Plug 'arcticicestudio/nord-vim', {
    \ 'branch': 'develop',
    \ 'do': 'ln -fnsv ~/.vim/plugged/nord-vim/colors/* ~/.vim/colors',
    \ 'on': 'NeverToggle'
    \ }
Plug 'jonathanfilip/vim-lucius', {
    \ 'do': 'ln -fnsv ~/.vim/plugged/vim-lucius/colors/* ~/.vim/colors',
    \ 'on': 'NeverToggle'
    \ }
Plug 'yuttie/hydrangea-vim', {
    \ 'do': 'ln -fnsv ~/.vim/plugged/hydrangea-vim/colors/* ~/.vim/colors'
    \ }
Plug 'NLKNguyen/papercolor-theme', {
    \ 'do': 'ln -fnsv ~/.vim/plugged/papercolor-theme/colors/* ~/.vim/colors'
    \ }
Plug 'bluz71/vim-moonfly-colors', {
    \ 'do': 'ln -fnsv ~/.vim/plugged/vim-moonfly-colors/colors/* ~/.vim/colors'
    \ }
call plug#end()

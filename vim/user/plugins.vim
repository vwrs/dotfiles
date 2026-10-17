" vim-plug
" ---------------
call plug#begin(expand('~/.vim/plugged'))
" Make sure you use single quotes
" utils
" ----------
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-tree.lua', { 'on': ['NvimTreeToggle', 'NvimTreeFindFile'] }
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'on': 'Telescope' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'on': 'Telescope', 'do': 'make' }
Plug 'amrbashir/nvim-docs-view', { 'on': 'DocsViewToggle'}
Plug 'folke/trouble.nvim', { 'on': 'Trouble' }
Plug 'rcarriga/nvim-notify'
Plug 'MunifTanjim/nui.nvim'
Plug 'folke/noice.nvim'

Plug 'tpope/vim-sleuth'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-fugitive'
Plug 'kana/vim-smartinput'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bronson/vim-trailing-whitespace'
Plug 'kassio/neoterm', { 'on': ['Tclose', 'TREPLSendLine', 'TREPLSendSelection'] }
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
Plug 'williamboman/mason.nvim', { 'on': 'Mason'}
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvimtools/none-ls.nvim'  " formatter & linter (replacement for null-ls)
Plug 'nvimtools/none-ls-extras.nvim'
" AI
Plug 'github/copilot.vim'

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
Plug 'alvan/vim-closetag', { 'for': ['html', 'php', 'twig'] }

" colorscheme
" ----------
Plug 'EdenEast/nightfox.nvim'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'w0ng/vim-hybrid'
Plug 'gosukiwi/vim-atom-dark'
Plug 'joshdick/onedark.vim'
Plug 'jacoborus/tender.vim'
Plug '29decibel/codeschool-vim-theme'
Plug 'vim-scripts/twilight'
Plug 'vim-scripts/phd'
Plug 'ciaranm/inkpot'
Plug 'arcticicestudio/nord-vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'yuttie/hydrangea-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'bluz71/vim-moonfly-colors'
call plug#end()

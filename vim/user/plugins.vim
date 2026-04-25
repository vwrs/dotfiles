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
Plug 'folke/trouble.nvim', { 'on': ['Trouble', 'TroubleToggle'] }
Plug 'rcarriga/nvim-notify'
Plug 'MunifTanjim/nui.nvim'
Plug 'folke/noice.nvim'

Plug 'tpope/vim-sleuth'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-fugitive'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
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
Plug 'xTacobaco/cursor-agent.nvim', { 'on': ['CursorAgent', 'CursorAgentSelection', 'CursorAgentBuffer'] }

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
Plug 'tell-k/vim-autopep8', { 'for': 'python' }
Plug 'jalvesaq/Nvim-R', { 'for': 'r' }
Plug 'alvan/vim-closetag', { 'for': ['html', 'php', 'twig'] }
Plug 'keith/tmux.vim', { 'for': 'tmux'}
Plug 'cespare/vim-toml'

" colorscheme
" ----------
Plug 'EdenEast/nightfox.nvim', { 'on': 'NeverToggle' }
Plug 'altercation/vim-colors-solarized', { 'on': 'NeverToggle' }
Plug 'tomasr/molokai', { 'on': 'NeverToggle' }
Plug 'w0ng/vim-hybrid', { 'on': 'NeverToggle' }
Plug 'gosukiwi/vim-atom-dark', { 'on': 'NeverToggle' }
Plug 'joshdick/onedark.vim', { 'on': 'NeverToggle' }
Plug 'jacoborus/tender.vim', { 'on': 'NeverToggle' }
Plug '29decibel/codeschool-vim-theme', { 'on': 'NeverToggle' }
Plug 'vim-scripts/twilight', { 'on': 'NeverToggle' }
Plug 'vim-scripts/phd', { 'on': 'NeverToggle' }
Plug 'ciaranm/inkpot', { 'on': 'NeverToggle' }
Plug 'arcticicestudio/nord-vim', { 'on': 'NeverToggle' }
Plug 'jonathanfilip/vim-lucius', { 'on': 'NeverToggle' }
Plug 'yuttie/hydrangea-vim', { 'on': 'NeverToggle' }
Plug 'NLKNguyen/papercolor-theme', { 'on': 'NeverToggle' }
Plug 'bluz71/vim-moonfly-colors', { 'on': 'NeverToggle' }
call plug#end()

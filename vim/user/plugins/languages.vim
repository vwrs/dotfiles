scriptencoding utf-8

lua <<EOF
-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

-- mason
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright", "dockerls", "docker_compose_language_service",
    "marksman", "vimls", "lua_ls", "bashls", "clangd"
  }
})

-- lspconfig
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>l', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>la', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>lr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>ll', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', ',f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  debounce_text_changes = 150,
}

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- lspconfig language-specific
local path = require('lspconfig/util').path

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({'*', '.*'}) do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.join(path.dirname(match), 'bin', 'python')
    end
  end

  -- Fallback to system Python.
  return exepath('python3') or exepath('python') or 'python'
end

lspconfig.pyright.setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  before_init = function(_, config)
    config.settings.python.pythonPath = get_python_path(config.root_dir)
  end
}

-- completions (nvim-cmp)
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-,>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- null-ls
local null_ls = require("null-ls")
-- register installed formatters and linters automatically
-- local mason_package = require("mason-core.package")
-- local mason_registry = require("mason-registry")
-- local null_sources = {}
-- for _, package in ipairs(mason_registry.get_installed_packages()) do
--         local package_categories = package.spec.categories[1]
--         if package_categories == mason_package.Cat.Formatter then
--                 table.insert(null_sources, null_ls.builtins.formatting[package.name])
--         end
--         if package_categories == mason_package.Cat.Linter then
--                 table.insert(null_sources, null_ls.builtins.diagnostics[package.name])
--         end
-- end

null_ls.setup({
  sources = {
    -- code actions
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.code_actions.shellcheck,

    -- completion
    null_ls.builtins.completion.spell,

    -- diagnostics
    null_ls.builtins.diagnostics.checkmake,
    null_ls.builtins.diagnostics.flake8,

    -- formatting
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.textlint,
    null_ls.builtins.formatting.yq,

    -- hover
    null_ls.builtins.hover.printenv,
  }
})

-- docs-view
require('docs-view').setup {
  position = 'right',
  width = 60,
}

-- nvim-treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "c", "lua", "vim", "python",
    "bash", "help", "query", "markdown",
    "gitignore", "make", "json", "toml", "yaml"
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
  ignore_install = { },

  highlight = {
    enable = true,
    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    disable = {  },
    -- to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 200 * 1024 -- 200 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
require('nvim-treesitter').setup {}

require("trouble").setup {}

EOF

" Asynchronous Lint Engine
" let g:ale_sign_error = "\uf05e"
" let g:ale_sign_warning = "\uf071"

" language server
" ----------
" let g:LanguageClient_diagnosticsDisplay = {
"  \ 1: {
"    \ 'name': 'Error',
"    \ 'texthl': 'ALEError',
"    \ 'signText':  "\uf05e",
"    \ 'signTexthl': 'Error',
"    \ },
"  \ 2: {
"    \ 'name': 'Warning',
"    \ 'texthl': 'ALEWarning',
"    \ 'signText':  "\uf071",
"    \ 'signTexthl': 'ALEWarningSign',
"    \ },
"  \ 3: {
"    \ 'name': 'Information',
"    \ 'texthl': 'ALEInfo',
"    \ 'signText': "\uf05a",
"    \ 'signTexthl': 'ALEInfoSign',
"    \ },
"  \ 4: {
"    \ 'name': 'Hint',
"    \ 'texthl': 'ALEInfo',
"    \ 'signText': "\uf05a",
"    \ 'signTexthl': 'ALEInfoSign',
"    \ },
"  \ }


" language-specific settings
" ----------

" vimtex
" let g:vimtex_latexmk_continuous = 1
" let g:tex_flavor = 'latex'
" let g:vimtex_echo_ignore_wait = 1
" let g:vimtex_fold_enabled = 1
" let g:vimtex_fold_manual = 1
" let g:vimtex_quickfix_open_on_warning = 0

" Nvim-R
let g:R_nvimpager='vertical'
let g:R_tmux_title='Nvim-R'
let g:R_source='$HOME/.vim/plugged/Nvim-R/R/tmux_split.vim'

" vim-cellmode
let g:cellmode_tmux_sessionname=''  " Will try to automatically pickup tmux session
let g:cellmode_tmux_windowname=''
let g:cellmode_tmux_panenumber='1'

" rust
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'
let g:racer_cmd = '$HOME/.cargo/bin/racer'

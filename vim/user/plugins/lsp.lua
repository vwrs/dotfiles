-- mason
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'pyright', 'dockerls', 'docker_compose_language_service',
    'marksman', 'vimls', 'lua_ls', 'bashls', 'clangd'
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
local on_attach = function(_, bufnr)
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
      vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-m>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item.
    -- vsnip
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn['vsnip#jumpable'](1) == 1 then
        feedkey('<Plug>(vsnip-jump-next)', '')
      else
        fallback() -- The fallback function sends a already mapped key. i.e., `<Tab>`.
      end
    end, {'i', 's'}),
    ['<S-Tab>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn['vsnip#jumpable'](-1) == 1 then
        feedkey('<Plug>(vsnip-jump-prev)', '')
      end
    end, {'i', 's'}),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  }),
	completion = {
		autocomplete = {
			  cmp.TriggerEvent.TextChanged,
			  cmp.TriggerEvent.InsertEnter,
    },
    completeopt = 'menuone,noinsert,noselect',
    keyword_length = 1,
	},
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
local null_ls = require('null-ls')
local nlbuiltins = null_ls.builtins
-- register installed formatters and linters automatically
-- local mason_package = require('mason-core.package')
-- local mason_registry = require('mason-registry')
-- local null_sources = {}
-- for _, package in ipairs(mason_registry.get_installed_packages()) do
--         local package_categories = package.spec.categories[1]
--         if package_categories == mason_package.Cat.Formatter then
--                 table.insert(null_sources, nlbuiltins.formatting[package.name])
--         end
--         if package_categories == mason_package.Cat.Linter then
--                 table.insert(null_sources, nlbuiltins.diagnostics[package.name])
--         end
-- end

null_ls.setup({
  sources = {
    -- code actions
    nlbuiltins.code_actions.eslint,
    nlbuiltins.code_actions.shellcheck,

    -- completion
    -- nlbuiltins.completion.spell,

    -- diagnostics
    nlbuiltins.diagnostics.actionlint,  -- GitHub Actions
    nlbuiltins.diagnostics.checkmake,
    nlbuiltins.diagnostics.dotenv_linter,
    -- Python
    -- nlbuiltins.diagnostics.flake8,
    nlbuiltins.diagnostics.ruff,
    nlbuiltins.diagnostics.mypy,
    nlbuiltins.diagnostics.pydocstyle.with({
      -- ref: https://www.pydocstyle.org/en/stable/error_codes.html
      -- NOTE: D212 and D213 are mutually exclusive.
      extra_args = { '--ignore', 'D100,D203,D205,D212,D300,D400,D403,D406,D407,D413,D415' }
    }),
    --
    nlbuiltins.diagnostics.sqlfluff.with({
      extra_args = {
        '--dialect', 'bigquery',
        -- '--rules', 'core',
        '--exclude-rules', 'L003,L010,L014,L016,L019,L027,L034,L064,L071'
      },
    }),
    nlbuiltins.diagnostics.shellcheck,
    nlbuiltins.diagnostics.zsh,

    nlbuiltins.diagnostics.hadolint,  -- Docker
    nlbuiltins.diagnostics.yamllint.with({
      extra_args = { '-d', '{extends: relaxed, rules: {line-length: {max: 120}}}' }
    }),
    nlbuiltins.diagnostics.markdownlint.with({
      extra_args = { '--disable', 'line-length', '--disable', 'url'}
    }),
    nlbuiltins.diagnostics.textlint,
    nlbuiltins.diagnostics.terraform_validate,
    nlbuiltins.diagnostics.vint,
    nlbuiltins.diagnostics.luacheck,

    -- formatting
    nlbuiltins.formatting.isort,
    nlbuiltins.formatting.black,
    nlbuiltins.formatting.textlint,
    -- To generate a TOC, add <!-- toc --> before headers in your markdown file.
    nlbuiltins.formatting.markdown_toc,
    nlbuiltins.formatting.yq,

    -- hover
    nlbuiltins.hover.printenv,
  }
})

require('trouble').setup {}

-- disable diagnostic for .env file
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.env",
  group = vim.api.nvim_create_augroup("__env", {clear=true}),
  callback = function(args)
    vim.diagnostic.disable(args.buf)
  end
})

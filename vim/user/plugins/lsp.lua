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
vim.keymap.set('n', '<space>l', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- NOTE: omnifunc, K, [d and ]d are set by Neovim by default
local on_attach = function(_, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
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

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-------------------------------
-- lspconfig language-specific
-------------------------------
-- python
local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return vim.fs.joinpath(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv in workspace directory.
  -- (workspace is nil in single file mode)
  if workspace then
    for _, pattern in ipairs({'*', '.*'}) do
      local match = vim.fn.glob(vim.fs.joinpath(workspace, pattern, 'pyvenv.cfg'))
      if match ~= '' then
        return vim.fs.joinpath(vim.fs.dirname(match), 'bin', 'python')
      end
    end
  end

  -- Fallback to system Python. (exepath() returns '' when not found)
  for _, exe in ipairs({'python3', 'python'}) do
    local path = vim.fn.exepath(exe)
    if path ~= '' then
      return path
    end
  end
  return 'python'
end

vim.lsp.config('pyright', {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  before_init = function(_, config)
    config.settings = config.settings or {}
    config.settings.python = config.settings.python or {}
    config.settings.python.pythonPath = get_python_path(config.root_dir)
  end
})
vim.lsp.enable('pyright')

-- terraform
vim.lsp.config('terraformls', {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
})
vim.lsp.enable('terraformls')
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
    vim.lsp.buf.format({ name = 'terraformls' })
  end,
})
-------------------------------

-- completions (nvim-cmp)
local cmp = require'cmp'

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
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

null_ls.setup({
  sources = {
    -- code actions
    require("none-ls.code_actions.eslint_d"),

    -- diagnostics
    nlbuiltins.diagnostics.actionlint,  -- GitHub Actions
    nlbuiltins.diagnostics.checkmake,
    nlbuiltins.diagnostics.dotenv_linter,
    -- Python
    require("none-ls.diagnostics.ruff"),
    nlbuiltins.diagnostics.mypy,
    nlbuiltins.diagnostics.sqlfluff.with({
      extra_args = {
        '--dialect', 'bigquery',
        '--exclude-rules', 'LT02,CP01,CP02,LT05,LT04,RF02,ST06,CV10,LT01'
      },
    }),
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

    -- formatting
    -- Python: sort imports (isort), then format (black)
    require("none-ls.formatting.ruff").with({ extra_args = { '--select', 'I' } }),
    require("none-ls.formatting.ruff_format"),
    nlbuiltins.formatting.textlint,
    require("none-ls.formatting.yq"),

    -- hover
    nlbuiltins.hover.printenv,
  }
})

require("user.plug").setup_when_loaded("trouble.nvim", function()
  require("trouble").setup({})
end)

-- disable diagnostic for .env file
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.env",
  group = vim.api.nvim_create_augroup("__env", {clear=true}),
  callback = function(args)
    vim.diagnostic.enable(false, { bufnr = args.buf })
  end
})

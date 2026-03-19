local parsers = {
  "c", "lua", "vim", "python", "regex",
  "go", "ruby", "javascript",
  "html", "css", "terraform", "dockerfile",
  "bash", "query", "markdown",
  "gitignore", "make", "json", "toml", "yaml"
}

local treesitter = require('nvim-treesitter')
treesitter.setup {}
treesitter.install(parsers)

local max_filesize = 100 * 1024 -- 100 KB
local augroup = vim.api.nvim_create_augroup("UserTreesitter", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  callback = function(args)
    local bufname = vim.api.nvim_buf_get_name(args.buf)
    local ok_stat, stats = pcall(vim.uv.fs_stat, bufname)
    if ok_stat and stats and stats.size > max_filesize then
      return
    end

    local lang = vim.treesitter.language.get_lang(args.match) or args.match
    local ok_lang = pcall(vim.treesitter.language.inspect, lang)
    if not ok_lang then
      return
    end

    -- Enable treesitter highlight/folding/indent for supported filetypes.
    pcall(vim.treesitter.start, args.buf, lang)
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo.foldmethod = "expr"
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
})

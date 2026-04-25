local function setup_when_plug_loaded(name, setup_fn)
  local plugs = vim.g.plugs or {}
  if plugs[name] and plugs[name].loaded == 1 then
    setup_fn()
    return
  end

  vim.api.nvim_create_autocmd("User", {
    pattern = name,
    once = true,
    callback = setup_fn,
  })
end

setup_when_plug_loaded("nvim-tree.lua", function()
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
end)

setup_when_plug_loaded("nvim-docs-view", function()
  require("docs-view").setup({
    position = "right",
    width = 60,
  })
end)

setup_when_plug_loaded("Comment.nvim", function()
  require("Comment").setup({
    padding = true,
    -- toggle keymap
    toggler = {
      line = 'gcc',
      -- block = 'gbc',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
      line = "gc",
      block = "gb",
    },
    extra = {
      above = "gcO",
      below = "gco",
      eol = "gcA",
    },
    ---Enable keybindings
    mappings = {
      ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
      basic = true,
      extra = true,
    },
  })
end)

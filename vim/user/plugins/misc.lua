local setup_when_plug_loaded = require("user.plug").setup_when_loaded

setup_when_plug_loaded("nvim-tree.lua", function()
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

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

setup_when_plug_loaded("telescope.nvim", function()
  require("telescope").setup({
    find_command = {
      "rg", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case"
    },
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      }
    }
  })
  require("telescope").load_extension("fzf")
end)

setup_when_plug_loaded("nvim-notify", function()
  require("notify").setup({
    background_colour = "#000000",
  })
end)

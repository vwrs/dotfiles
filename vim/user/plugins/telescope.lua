local setup_when_plug_loaded = require("user.plug").setup_when_loaded

setup_when_plug_loaded("telescope.nvim", function()
  require("telescope").setup({
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

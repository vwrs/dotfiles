require('telescope').setup({

  find_command = {
    'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'
  }
})

require("notify").setup({
  background_colour = "#000000",
})

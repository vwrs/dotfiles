require('telescope').setup({

  find_command = {
    'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'
  }
})

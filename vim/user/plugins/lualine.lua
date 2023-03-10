-- doc: https://github.com/nvim-lualine/lualine.nvim
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'palenight',  -- 'auto', 'material', 'horizon', 'palenight', 'onedark'
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    tabline_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {
      {
        'buffers',
        mode = 0, -- 0: Shows buffer name
                  -- 1: Shows buffer index
                  -- 2: Shows buffer name + buffer index
                  -- 3: Shows buffer number
                  -- 4: Shows buffer name + buffer number
        max_length = vim.o.columns * 2 / 3,
        symbols = {
          modified = ' 贈',
          alternate_file = '',
          directory =  '',
        },
      },
    },
    lualine_b = {'diff'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  winbar = {
    lualine_a = {},
    lualine_b = {
      {
        'filename',
        path = 3
      },
    },
    lualine_c = {'searchcount'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'filesize'}
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {
      {
        'filename',
        path = 3
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'filesize'}
  },
  extensions = {}
}


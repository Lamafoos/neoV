-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = {
      hl = "DiffAdd",
      text = "+",
      numhl = "GitSignsAddNr",
    },
    change = {
      hl = "DiffChange",
      text = "•",
      numhl = "GitSignsChangeNr",
    },
    delete = {
      hl = "DiffDelete",
      text = "-",
      numhl = "GitSignsDeleteNr",
    },
    topdelete = {
      hl = "DiffDelete",
      text = "‾",
      numhl = "GitSignsDeleteNr",
    },
    changedelete = {
      hl = "DiffChange",
      text = "~",
      numhl = "GitSignsChangeNr",
    },
  },
  numhl = true,
  current_line_blame = true
}

-- File explorer
require'nvim-tree'.setup {
  open_on_setup = true,
  view = {
    width = 40,
    number = true,
    relativenumber = true,
    update_to_buf_dir = {
      enable = true,
      auto_open = true,
    },
    update_focused_file = {
      enable      = true,
      update_cwd  = true,
      ignore_list = {}
    },

  },
}

-- Devicons
require'nvim-web-devicons'.setup {}

-- Lualine
require('lualine').setup({
  options = { theme = 'rose-pine' }
})

-- Treesitter
require('treesitter')

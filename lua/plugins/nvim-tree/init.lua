-----------------------------------------------------------
-- Nvum Tree
-----------------------------------------------------------

local nvim_tree = require('nvim-tree')

nvim_tree.setup {
  respect_buf_cwd = true,

  open_on_setup = false,
  update_cwd = true,
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  view = {
    width = 40,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },

  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  renderer = {
    special_files = { "README.md", "readme.md" },
    highlight_git = true,
    highlight_opened_files = 'all',
  }
}

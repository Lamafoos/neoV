-----------------------------------------------------------
-- Nvum Tree
-----------------------------------------------------------

local nvim_tree = require('nvim-tree')

nvim_tree.setup {
  open_on_setup = false,
  update_cwd = true,
  view = {
    width = 40,
    number = false,
    relativenumber = false,
    update_to_buf_dir = {
      enable = true,
      auto_open = false,
    },
    update_focused_file = {
      enable      = true,
      update_cwd  = true,
      ignore_list = {}
    },
  },
}


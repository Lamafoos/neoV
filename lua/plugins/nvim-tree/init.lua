-- File explorer
require'nvim-tree'.setup {
  open_on_setup = true,
  view = {
    width = 40,
    number = true,
    relativenumber = false,
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

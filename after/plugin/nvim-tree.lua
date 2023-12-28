-----------------------------------------------------------
-- Nvim Tree
-----------------------------------------------------------

local nvim_tree = require('nvim-tree')
local g = vim.g -- global variables

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.nvim_tree_refresh_wait = 200
g.nvim_tree_highlight_current_file = 1

nvim_tree.setup {
  respect_buf_cwd = true,

  update_cwd = true,
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  view = {
    width = 40,
    -- number = false,
    -- relativenumber = false,
    -- signcolumn = "yes",
  },

  update_focused_file = {
    enable = true,
    update_root = true,
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
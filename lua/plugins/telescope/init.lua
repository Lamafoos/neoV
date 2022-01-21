-----------------------------------------------------------
-- Telescope
-----------------------------------------------------------

-- local telescope = require('telescope')
local fb_actions = require "telescope".extensions.file_browser.actions

require('telescope').setup {
  defaults = {
    initial_mode = "insert",
    file_ignore_patterns = { ".git/" },
    sorting_strategy = "ascending",
    color_devicons = true,
    -- use_less = true,
    border = {},
    preview = {
      timeout = 500,
    },
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
  },
  pickers = {
    find_files = {
      hidden = true,
    }
  },
  extensions = {
    file_browser = {
        files = true,
        depth = false,
        hidden = true,
        respect_gitignore = false,
        mappings = {
          ["n"] = {
            ["<C-c>"] = fb_actions.create,
            ["<C-d>"] = fb_actions.remove,
            ["<C-m>"] = fb_actions.move,
          }
        }
    }
  },
  -- file_sorter = require("telescope.sorters").get_fuzzy_file,
  -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
  path_display = { "truncate" },
  set_env = { ["COLORTERM"] = "truecolor" }, 
}

require("telescope").load_extension "file_browser"
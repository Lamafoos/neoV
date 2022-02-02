-----------------------------------------------------------
-- Telescope
-----------------------------------------------------------

local telescope = require('telescope')
local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    initial_mode = "insert",
    file_ignore_patterns = { ".git/", "node_modules/" },
    sorting_strategy = "ascending",
    color_devicons = true,
    -- path_display = "truncate",
    border = {},
    preview = {
      timeout = 500,
    },
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
  },
  -- pickers = {
  --   find_files = {
  --     hidden = true,
  --   }
  -- },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },

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

  path_display = { "truncate" },
  set_env = { ["COLORTERM"] = "truecolor" }, 
}

telescope.load_extension('file_browser')
telescope.load_extension('fzf')
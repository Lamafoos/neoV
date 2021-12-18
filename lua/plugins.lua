----------
-- API ---
----------
local execute = vim.api.nvim_command
local fn = vim.fn
----------

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Performance
  use "nathom/filetype.nvim"

  -- Starpage
  use {
  'goolord/alpha-nvim',
  requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.opts)
      local startify = require("alpha.themes.startify")
      startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
      startify.section.bottom_buttons.val = {
      startify.button("e", "new file", ":ene <bar> startinsert <cr>"),
      startify.button("v", "neovim config", ":e ~/.config/nvim/init.lua<cr>"),
      startify.button("q", "quit nvim", ":qa<cr>"),
    }
  end
  }	

  -- Theme
  use ({"catppuccin/nvim",
as = "catppuccin"
  }) 


use "p00f/nvim-ts-rainbow"
  -- Treesitter
    use {'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate"}
    
  -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

     -- VCS
    use {
        'lewis6991/gitsigns.nvim',
        opt = true,
        -- after = "vim-fugitive",
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require'gitsigns'.setup() end
    }
    
  -- Completion
    use { 
	'hrsh7th/nvim-cmp',
	event = "UIEnter",
	opt = true,
    requires = {
		{'hrsh7th/cmp-buffer'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/cmp-path'},
		{'hrsh7th/cmp-cmdline'},
		{'hrsh7th/cmp-emoji'}
        },
	config = function() require'completion'.setup() end
	}
        use {
        'L3MON4D3/LuaSnip',
        after = "nvim-cmp",
        requires = {{"rafamadriz/friendly-snippets"}},
        config = function() require'completion'.luasnip() end
    }    
end
)

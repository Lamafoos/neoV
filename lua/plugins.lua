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
      require'alpha'.setup(require'alpha.themes.dashboard'.opts)
    end
  }	

  -- File Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
  }

  -- Treesitter
  use "p00f/nvim-ts-rainbow"
      use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate"
    }

    -- Telescope Extensions
  use { "nvim-telescope/telescope-file-browser.nvim" }
    -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
    
  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- Git
  use {
    'tpope/vim-fugitive',  
    event = "UIEnter"
	}
  use {
    "lewis6991/gitsigns.nvim", 
    requires = { "nvim-lua/plenary.nvim" }
  }
    
  -- Completion
  use {'L3MON4D3/LuaSnip'}

  use { 
	'hrsh7th/nvim-cmp',
    requires = {
    {'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/cmp-path'},
		{'hrsh7th/cmp-buffer'},
		{'hrsh7th/cmp-cmdline'},
   },
	}
  use { 'saadparwaiz1/cmp_luasnip' }
  

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

    -- Theme
    use 'kyazdani42/nvim-web-devicons'
    use({
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
          vim.cmd('colorscheme rose-pine')
      end
  })
end
)

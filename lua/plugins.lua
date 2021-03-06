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
  }

  -- File Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
  }

  -- Telescope Extensions
  use { "nvim-telescope/telescope-file-browser.nvim" }
  --
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- LSP
  use { 'jose-elias-alvarez/nvim-lsp-ts-utils' } -- ts-utils
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- Linter
  use 'mfussenegger/nvim-lint'

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
  use { 'L3MON4D3/LuaSnip' }
  use { 'onsails/lspkind-nvim' }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-cmdline' },
      { 'saadparwaiz1/cmp_luasnip' }
    },
  }
  -- use { 'saadparwaiz1/cmp_luasnip' }


  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Theme
  use 'kyazdani42/nvim-web-devicons'

  use({
    "catppuccin/nvim",
    as = "catppuccin"
  })
end
)

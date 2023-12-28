-----------------------------------------------------------
-- Plugins ------------------------------------------------
-----------------------------------------------------------
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop

-- Auto-install lazy.nvim if not present
if not uv.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
{'nvim-lua/plenary.nvim'},

-- File Explorer
{
'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons',
  },
},
-- Telescope Extensions
{ "nvim-telescope/telescope-file-browser.nvim" },
{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

-- Telescope
{
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  requires = { {'nvim-lua/plenary.nvim'} }
},

-- Harpoon
{
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  requires = { {"nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim"} },
},

-- UndoTree
{'mbbill/undotree'},

-- Treesitter
{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

-- LSP Support
{'williamboman/mason.nvim'},
{'williamboman/mason-lspconfig.nvim'},
{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
{'neovim/nvim-lspconfig'},
{'simrat39/rust-tools.nvim'},

-- Completion
{'hrsh7th/cmp-nvim-lsp'},
{'hrsh7th/nvim-cmp'},
{'L3MON4D3/LuaSnip'},
{'onsails/lspkind-nvim'},

-- Autocompletion
{
  'hrsh7th/nvim-cmp',
  dependencies = {
    {'L3MON4D3/LuaSnip'}
  },
},
-- Git
{'tpope/vim-fugitive'},
{
  'kdheepak/lazygit.nvim',
  dependencies = {
    {"nvim-lua/plenary.nvim"}
  },
},
{'lewis6991/gitsigns.nvim'},

-- Theme
{'kyazdani42/nvim-web-devicons'},
{ 'projekt0n/github-nvim-theme', as = "github-theme" },
-- {'marko-cerovac/material.nvim'},
{"folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
},
{'nvim-lualine/lualine.nvim'},
{
  'goolord/alpha-nvim',
  config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
  end
};
{'rcarriga/nvim-notify'}
}

require("lazy").setup(plugins)
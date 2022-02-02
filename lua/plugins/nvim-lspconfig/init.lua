-----------------------------------------------------------
-- LSP config
-----------------------------------------------------------

local nvim_lsp = require 'lspconfig'
local util = require 'lspconfig.util'
local on_attach_common = require 'plugins.nvim-lspconfig.on-attach'
local on_init_common = require 'plugins.nvim-lspconfig.on-init'
local capabilities = require 'plugins.nvim-lspconfig.capabilities'

-- Language server list: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = { 
  volar = {'volar'}, 
  html = {'html'}, 
  tsserver = {'tsserver'}, 
  cssls = {'cssls'} 
}

for name, opts in pairs(servers) do
  if type(opts) == 'function' then
    opts = { opts }
  else
  local client = nvim_lsp[name]
  client.setup {
    on_attach = on_attach_common,
    on_init = on_init_common,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 100,
    }
  }
  end
end

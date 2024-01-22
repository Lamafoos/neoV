-- -----------------------------------------------------------
-- -- LSP config
-- -----------------------------------------------------------

-- local nvim_lsp = require 'lspconfig'
-- local util = require 'lspconfig.util'
-- local on_attach_common = require 'plugins.nvim-lspconfig.on-attach'
-- local on_init_common = require 'plugins.nvim-lspconfig.on-init'
-- local capabilities = require 'plugins.nvim-lspconfig.capabilities'

-- -- Language server list: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- local servers = {
--   -- tsserver = {
--   --   capabilities = capabilities,
--   --   on_attach = function(client, bufnr)
--   --     if client.config.flags then
--   --       client.config.flags.allow_incremental_sync = true
--   --     end
--   --     client.resolved_capabilities.document_formatting = false
--   --     client.resolved_capabilities.document_range_formatting = false
--   --     local ts_utils = require('nvim-lsp-ts-utils')
--   --     ts_utils.setup {}
--   --     ts_utils.setup_client(client)
--   --     local opts = { silent = true }
--   --     vim.api.nvim_buf_set_keymap(
--   --       bufnr,
--   --       'n',
--   --       '<leader>ao',
--   --       ':TSLspOrganize<CR>',
--   --       opts
--   --     )
--   --     vim.api.nvim_buf_set_keymap(
--   --       bufnr,
--   --       'n',
--   --       '<leader>ai',
--   --       ':TSLspImportAll<CR>',
--   --       opts
--   --     )
--   --     on_attach_common(client)
--   --   end, },
--   tsserver = {
--     cmd = { "typescript-language-server", "--stdio" },
--     filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx",
--       "vue" }
--   },
--   volar = { cmd = { "volar-server", "--stdio" } },
--   html = { cmd = { "vscode-html-language-server", "--stdio" } },
--   cssls = { cmd = { "vscode-css-language-server", "--stdio" } },
-- }

-- for name, opts in pairs(servers) do
--   if type(opts) == 'function' then
--     opts = { opts }
--   else
--     local client = nvim_lsp[name]
--     client.setup {
--       on_attach = on_attach_common,
--       on_init = on_init_common,
--       capabilities = capabilities,
--       flags = {
--         debounce_text_changes = 100,
--       }
--     }
--   end
-- end

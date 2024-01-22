
local lsp_zero = require('lsp-zero')
local lsp_config = require('lspconfig')

local on_init_common = require('lsp.on-init')
-- local on_attach_common = require('lsp.on-attach')
-- local capabilities = require ('lsp.capabilities')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})

  -- local opts = {buffer = bufnr, remap = false}

  -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  -- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  -- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp_zero.set_server_config({
  on_init = function(client)
    vim.notify(
      client.name .. ': Language Server successfully started!',
      'info'
    )
  end,
})

--# rustup component add rust-analyzer in terminal
vim.g.rustaceanvim = {
  server = {
    capabilities = lsp_zero.get_capabilities(),
    on_init = on_init_common
  },
}

require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require('mason-lspconfig').setup({
  ensure_installed = {
    "lua_ls",
    "tsserver",
    "cssls",
    "html",
    "eslint",
    "rust_analyzer",
    "volar"
  },
  handlers = {
    lsp_zero.default_setup,
    rust_analyzer = lsp_zero.noop,
  },
})

lsp_zero.set_sign_icons({
  error = "",
  warning = "",
  hint = "",
  information = ""
})
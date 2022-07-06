-----------------------------------------------------------
-- Nvim-cmp config
-----------------------------------------------------------

local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

cmp.setup {
  -- REQUIRED: Load snippet enginge
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  -- Key mapping
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },

    -- Tab mappings
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end
  },

  -- Completion settings
  completion = {
    completeopt = 'menu,menuone,noselect',
    keyword_length = 1
  },
  experimental = {
    ghost_text = true,
  },
  window = {
    documentation = {
      border = { "", "", "", "", "", "", "", "" },
    },
  },
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'spell' },
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true, -- show text alongside icons
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      before = function(entry, vim_item)
        vim_item.kind = string.format("%s %s", lspkind.presets.default[vim_item.kind], vim_item.kind)
        vim_item.menu = ({
          nvim_lsp = "",
          treesitter = "",
          path = "",
          buffer = "ь",
          zsh = "",
          luasnip = "",
          spell = "",
        })[entry.source.name]
        return vim_item
      end
    })
  },
}

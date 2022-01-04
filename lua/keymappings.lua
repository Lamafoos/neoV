local key_map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Surround word under cursor w/ backticks (required vim-surround)
key_map( "n", "<leader>`", "ysiW", opts )

-- REPLACE: delete inner word & replace with last yanked (including system)
key_map("n", ",r", '"_diwhp', opts)

-- paste last thing yanked(not system copied), not deleted
key_map("n", ",p", '"0p', opts)
key_map("n", ",P", '"0P', opts)

-- treesitter-unit select maps
key_map("x", "iu", ':lua require"treesitter-unit".select()<CR>', opts)
key_map("x", "au", ':lua require"treesitter-unit".select(true)<CR>', opts)
key_map("o", "iu", ':<c-u>lua require"treesitter-unit".select()<CR>', opts)
key_map("o", "au", ':<c-u>lua require"treesitter-unit".select(true)<CR>', opts)

-- one of the greatest commands ever
key_map("n", "<space>t", ":TSHighlightCapturesUnderCursor<CR>", opts)

-- Move between Vimdows
key_map("n", "<up>", "<C-w><up>", opts)
key_map("n", "<down>", "<C-w><down>", opts)
key_map("n", "<left>", "<C-w><left>", opts)
key_map("n", "<right>", "<C-w><right>", opts)

-- Toggle vim-tree
key_map('n', '<C-b>', ':NvimTreeToggle<CR>', opts)
key_map('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)


-- windows
-- key_map('n', '<leader>sh', ':vsp<CR>', opts) -- split horizontally
-- key_map('n', '<leader>sv', ':sp<CR>', opts) -- split vertically

-- open file browser
key_map("n", "<space>ff", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", opts)

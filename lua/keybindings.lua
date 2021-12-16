local key_map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

-- Surround word under cursor w/ backticks (required vim-surround)
key_map( "n", "<leader>`", "ysiW", opts )

-- REPLACE: delete inner word & replace with last yanked (including system)
key_map("n", ",r", '"_diwhp', { noremap = true })

-- paste last thing yanked(not system copied), not deleted
key_map("n", ",p", '"0p', { noremap = true })
key_map("n", ",P", '"0P', { noremap = true })

-- treesitter-unit select maps
key_map("x", "iu", ':lua require"treesitter-unit".select()<CR>', { noremap = true })
key_map("x", "au", ':lua require"treesitter-unit".select(true)<CR>', { noremap = true })
key_map("o", "iu", ':<c-u>lua require"treesitter-unit".select()<CR>', { noremap = true })
key_map("o", "au", ':<c-u>lua require"treesitter-unit".select(true)<CR>', { noremap = true })

-- one of teh greatest commands ever
key_map("n", "<space>t", ":TSHighlightCapturesUnderCursor<CR>", { noremap = true, silent = true })

-- Move between Vimdows
key_map("n", "<up>", "<C-w><up>", { noremap = false })
key_map("n", "<down>", "<C-w><down>", { noremap = false })
key_map("n", "<left>", "<C-w><left>", { noremap = false })
key_map("n", "<right>", "<C-w><right>", { noremap = false })


















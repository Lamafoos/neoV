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

-- shows any treesitter or syntax highlight groups under the cursor. Not working.
-- key_map("n", "<space>t", ":TSHighlightCapturesUnderCursor<CR>", opts)

-- Move between Vimdows
key_map("n", "<S-up>", "<C-w><up>", opts)
key_map("n", "<S-down>", "<C-w><down>", opts)
key_map("n", "<S-left>", "<C-w><left>", opts)
key_map("n", "<S-right>", "<C-w><right>", opts)

-- Move between Buffs
key_map("n", "<C-up>", ":blast<CR>", opts)
key_map("n", "<C-down>", ":bfirst<CR>", opts)
key_map("n", "<C-left>", ":bprevious<CR>", opts)
key_map("n", "<C-right>", ":bnext<CR>", opts)


-- Toggle vim-tree
key_map('n', '<C-b>', ':NvimTreeToggle<CR>', opts)
key_map('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)

-- FILES
-- Find file
key_map("n", "<space>ff", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", opts)
-- Find recent
key_map("n", "<space>fr", "<cmd>Telescope oldfiles prompt_prefix=🔍 <CR>", opts)
-- Git branches
key_map("n", "<space>gb", "<cmd>Telescope git_branches<CR>",opts)

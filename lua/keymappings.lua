local key_map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local set = vim.keymap.set


-- general
-- key_map('n', 'H', '^', opts) -- start of line
-- key_map('n', 'L', '$', opts) -- end of line

-- Surround word under cursor w/ backticks (required vim-surround)
-- key_map("n", "<leader>`", "ysiW", opts)

-- paste last thing yanked(not system copied), not deleted
-- key_map("n", ",p", '"0p', opts)
-- key_map("n", ",P", '"0P', opts)

-- treesitter-unit select maps
-- key_map("x", "iu", ':lua require"treesitter-unit".select()<CR>', opts)
-- key_map("x", "au", ':lua require"treesitter-unit".select(true)<CR>', opts)
-- key_map("o", "iu", ':<c-u>lua require"treesitter-unit".select()<CR>', opts)
-- key_map("o", "au", ':<c-u>lua require"treesitter-unit".select(true)<CR>', opts)

-- shows any treesitter or syntax highlight groups under the cursor. Not working.
-- key_map("n", "<space>t", ":TSHighlightCapturesUnderCursor<CR>", opts)

-- Split window
-- key_map("n", "<leader>v", ":vsplit<CR>", opts)
-- key_map("n", "<leader>x", ":split<CR>", opts)

-- Move between Vimdows
-- key_map("n", "<S-up>", "<C-w><up>", opts)
-- key_map("n", "<S-down>", "<C-w><down>", opts)
-- key_map("n", "<S-left>", "<C-w><left>", opts)
-- key_map("n", "<S-right>", "<C-w><right>", opts)

-- -- Move between Buffs
-- key_map("n", "<C-up>", ":blast<CR>", opts)
-- key_map("n", "<C-down>", ":bfirst<CR>", opts)
-- key_map("n", "<C-left>", ":bprevious<CR>", opts)
-- key_map("n", "<C-right>", ":bnext<CR>", opts)

-- -- Move between Tabs
-- key_map("n", "<CS-up>", ":tablast<CR>", opts)
-- key_map("n", "<CS-down>", ":tabfirst<CR>", opts)
-- key_map("n", "<CS-left>", ":tabprevious<CR>", opts)
-- key_map("n", "<CS-right>", ":tabnext<CR>", opts)
-- key_map("n", "<CS-w>", ":tabclose<CR>", opts)

-- -- Tabs
-- key_map('n', '<leader>tn', ':tabnew<CR>', opts)
-- key_map('n', '<leader>tc', ':tabclose<CR>', opts)


-- -- Toggle vim-tree
key_map('n', '<leader>t', ':NvimTreeToggle<CR>', opts)

-- -- FILES
-- -- Find file
-- key_map("n", "<space>ff", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", opts)
-- -- Find recent
-- key_map("n", "<space>fr", "<cmd>Telescope oldfiles prompt_prefix=🔍 <CR>", opts)
-- -- Git branches
-- key_map("n", "<space>fg", "<cmd>Telescope git_branches<CR>", opts)
-- -- Find buffer
-- key_map("n", "<space>fb", "<cmd>Telescope buffers<CR>", opts);

-- -- Find in current file
-- key_map("n", "<space>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts);

-- -- Find text in project
-- key_map("n", "<space>fs", "<cmd>Telescope live_grep<CR>", opts);

-- Move lines
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "<C-down>", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")
set("v", "<C-up>", ":m '<-2<CR>gv=gv")

-- Keep cursor sane
set("n", "J", "mzJ`z") 
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("x", "<leader>p", [["_dP]]) -- overwrite without copying

-- Yank to system clipboard
set({"n", "v"}, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])

set("n", "Q", "<nop>")

-- switch project
set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- format
set("n", "<leader>f", vim.lsp.buf.format) -- format

-- quickfix
set("n", "<C-k>", "<cmd>cnext<CR>zz")
set("n", "<C-j>", "<cmd>cprev<CR>zz")
set("n", "<leader>k", "<cmd>lnext<CR>zz")
set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace the word your on
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- exit
set("i", "<C-c>", "<Esc>")
-- require("lazy").setup({
--   {
--       "kdheepak/lazygit.nvim",
--       -- optional for floating window border decoration
--       dependencies = {
--           "nvim-lua/plenary.nvim",
--       },
--   },
-- })

-- " setup mapping to call :LazyGit"
vim.keymap.set('n', "<leader>G", [[:LazyGit<CR>]])
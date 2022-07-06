-----------------------------------------------------------
-- ALIASES
-----------------------------------------------------------
local cmd = vim.cmd -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local env = vim.env -- environment variables
local fn = vim.fn -- call Vim functions
local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options
-----------------------------------------------------------
-- General
-----------------------------------------------------------
-- if vim.loop.os_uname().sysname == "Mac_OS" then
--   g.mapleader = '§' -- change leader to a strange symbol
-- end
opt.mouse = 'a' -- enable mouse support
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.swapfile = false -- don't use swapfile
opt.spell = true -- spellchecking
opt.spelllang = { 'en_us' } -- languange to spellcheck
-----------------------------------------------------------
-- UI
-----------------------------------------------------------
opt.number = true -- show line number
opt.relativenumber = true -- show relative number
opt.showmatch = true -- highlight matching parenthesis
opt.foldmethod = 'marker' -- enable folding (default 'foldmarker')
-- opt.colorcolumn = '80'        -- line lenght marker at 80 columns
opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- horizontal split to the bottom
opt.ignorecase = true -- ignore case letters when search
opt.incsearch = true -- show partial matches // I think
opt.smartcase = true -- ignore lowercase for the whole pattern
opt.linebreak = true -- wrap on word boundary
opt.termguicolors = true

-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]
cmd [[au BufWritePost <buffer> lua require('lint').try_lint()]]

-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
  augroup end
]], false)

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.shiftwidth = 2 -- shift 4 spaces when tab
opt.tabstop = 2 -- 1 tab == 4 spaces
opt.smartindent = true -- autoindent new lines

-- 4 spaces for selected filetypes
-- cmd [[
--   autocmd FileType py, something, something setlocal shiftwidth=4 tabstop=4
-- ]]

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- enable background buffers
opt.history = 300 -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240 -- max column for syntax highlight

-----------------------------------------------------------
-- File explorer
-----------------------------------------------------------
g.nvim_tree_refresh_wait = 300
g.nvim_tree_highlight_current_file = 1

-----------------------------------------------------------
-- LSP Gutter info
-- will probably break in future versions of nvim when name changes
-----------------------------------------------------------
local signs = {
  Error = "Error",
  Warn = "Warning",
  Hint = "Hint",
  Info = "Information",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  local nhl = "LspDiagnosticsDefault" .. icon
  fn.sign_define(hl, { text = '', texthl = hl, numhl = nhl })
end

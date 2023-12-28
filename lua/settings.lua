-----------------------------------------------------------
-- ALIASES ------------------------------------------------
-----------------------------------------------------------
-- local cmd = vim.cmd -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
-- local env = vim.env -- environment variables
-- local fn = vim.fn -- call Vim functions
local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options
-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = " "
-- if vim.loop.os_uname().sysname == "Mac_OS" then
--   g.mapleader = '§' -- change leader to a strange symbol
-- end
opt.mouse = 'a' -- enable mouse support
-- opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.swapfile = false -- don't use swapfile
opt.backup = false -- no backup
-- opt.undodir = os.getenv("Home") .."/.vim/undodir" -- 
-- opt.undofile = true
opt.spell = true -- spellchecking
opt.spelllang = { 'en_us' } -- languange to spellcheck
opt.updatetime = 50
-----------------------------------------------------------
-- UI
-----------------------------------------------------------
opt.number = true -- show line number
opt.relativenumber = true -- show relative number

-- opt.showmatch = true -- highlight matching parenthesis
-- opt.foldmethod = 'marker' -- enable folding (default 'foldmarker')
-- opt.colorcolumn = '80'        -- line lenght marker at 80 columns
-- opt.splitright = true -- vertical split to the right
-- opt.splitbelow = true -- horizontal split to the bottom
-- opt.ignorecase = true -- ignore case letters when search
opt.hlsearch = false -- show partial matches
opt.incsearch = true -- show partial matches
-- opt.smartcase = true -- ignore lowercase for the whole pattern
opt.linebreak = true -- dont cut word on word wrap
opt.termguicolors = true
opt.wrap = false
opt.scrolloff = 8

-- highlight on yank
exec([[
  augroup LuaHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup END
]], false)
-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.shiftwidth = 4 -- shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.softtabstop = 4 -- 1 tab == 4 spaces
opt.expandtab = true -- fill tab spaces

opt.smartindent = true -- autoindent new lines
-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- enable background buffers
opt.history = 300 -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240 -- max column for syntax highlight

-----------------------------------------------------------
-- LSP Gutter info
-- will probably break in future versions of nvim when name changes
-----------------------------------------------------------
-- local signs = {
--   Error = "Error",
--   Warn = "Warning",
--   Hint = "Hint",
--   Info = "Information",
-- }

-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   local nhl = "LspDiagnosticsDefault" .. icon
--   fn.sign_define(hl, { text = '', texthl = hl, numhl = nhl })
-- end

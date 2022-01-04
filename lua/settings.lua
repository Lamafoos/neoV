-----------------------------------------------------------
-- ALIASES
-----------------------------------------------------------
local cmd = vim.cmd  -- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript
local env = vim.env -- environment variables
local fn = vim.fn -- call Vim functions
local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options
-----------------------------------------------------------
-- General
-----------------------------------------------------------
if vim.loop.os_uname().sysname == "Mac_OS" then
  g.mapleader = '§'           -- change leader to a strange symbol
end
opt.mouse = 'a'               -- enable mouse support
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.swapfile = false          -- don't use swapfile
opt.spell = true							-- spellchecking
opt.spelllang = { 'en_us' }		-- languange to spellcheck
-----------------------------------------------------------
-- UI
-----------------------------------------------------------
opt.number = true             -- show line number
opt.showmatch = true          -- highlight matching parenthesis
opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
-- opt.colorcolumn = '80'        -- line lenght marker at 80 columns
opt.splitright = true         -- vertical split to the right
opt.splitbelow = true         -- horizontal split to the bottom
opt.ignorecase = true         -- ignore case letters when search
opt.incsearch = true          -- show partial matches // I think
opt.smartcase = true          -- ignore lowercase for the whole pattern
opt.linebreak = true          -- wrap on word boundary

-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

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
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true         -- enable background buffers
opt.history = 100         -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
opt.synmaxcol = 240       -- max column for syntax highlight

-----------------------------------------------------------
-- File explorer
-----------------------------------------------------------
g.nvim_tree_git_hl = 1
g.nvim_tree_refresh_wait = 300
g.nvim_tree_special_files = {}
g.nvim_tree_respect_buf_cwd = 1
g.nvim_tree_quit_on_open = 1

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
opt.termguicolors = true   -- use terminal colors
g.rose_pine_variant = 'moon' -- moon variant
cmd('colorscheme rose-pine')

------------
--- API ----
------------
local env = vim.env -- environment variables
local fn = vim.fn -- call Vim functions
local g = vim.g -- global variables
local o = vim.o -- global options
local w = vim.wo -- windows-scoped options
local opt = vim.opt -- table options (TODO: wanna know difference with `o`)
-----------


w.foldmethod = 'expr'

-- Global scope
o.smarttab = true
o.smartindent = true



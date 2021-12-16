-- Plugins
require('plugins')

-- Config / Setup
require('config')

-- Keybindings
require('keybindings')
if (vim.loop.os_uname().sysname == "windows") then
    require('keybindings-windows')
else 
    require('keybindings')
end

-- Options / Settings
require('options')

































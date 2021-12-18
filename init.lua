-- Plugins
require('plugins')

-- Config / Setup
require('config')

-- Keybindings
require('keybindings')
if (vim.loop.os_uname().sysname == "windows") then
   print 'Using window keybindings'
    require('keybindings-windows')
else 
    print 'Using default keybindings'
    require('keybindings')
end

-- Options / Settings
require('options')

































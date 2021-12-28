-----------------------------------------------------------
-- Alpha dashboard config
-----------------------------------------------------------
require('functions')

local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

-----------------------------------------------------------
-- Header
-----------------------------------------------------------
dashboard.section.header.val = {
  "                                                    ",
  " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                    ",
}

-----------------------------------------------------------
-- Menu
-----------------------------------------------------------
dashboard.section.buttons.val = {
  dashboard.button("e", "New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button('f', 'Find file', ':NvimTreeOpen<CR>'),
  dashboard.button("v", "Neovim config", ":e ~/.config/nvim/init.lua<CR>"),
  dashboard.button('u', 'Update plugins', ':PackerUpdate<CR>'),
  dashboard.button("q", "Quit neovim", ":qa<CR>"),
}

-----------------------------------------------------------
-- Footer 
-----------------------------------------------------------
local function footer()
  local datetime = os.date('%Y/%m/%d %H:%M')
  return datetime
end

dashboard.section.footer.val = {
  '',
  footer()
}

require('alpha').setup { dashboard.opts }
local g = vim.g
local o = vim.o

o.scrolloff = 10

o.number = true
o.numberwidth = 6
o.relativenumber = true
-- o.signcolumn = 'yes'
-- o.cursorline = true

o.expandtab = true
o.autoindent = true
o.wrap = true
o.textwidth = 100
o.tabstop = 4

o.ignorecase = true
o.smartcase = true

-- preserve view while jumping
o.jumpoptions = 'view'

-- command history length
o.history = 5000



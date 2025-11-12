-- show absolute line number on current line
vim.opt.number = true
-- other lines display relative lin numbers
vim.opt.relativenumber = true

-- indentation
vim.o.cindent = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.smartindent = true

vim.opt.wrap = true
-- line-wrapping maintains consistent indentation
vim.opt.breakindent = true

-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 25

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")



-- configure spectre - TODO put this in the spectre plugin file somehow
vim.keymap.set("n", "<leader>ssw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
vim.keymap.set("v", "<leader>ssw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})


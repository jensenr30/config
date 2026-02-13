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

-- Don't yank text when deleting
vim.keymap.set("x", "p", "P", { silent = true })
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "c", '"_c')

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

-- Scrolls %d lines at a time
--vim.opt.scroll = 5
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 25

-- highlight search results
vim.opt.hlsearch = true


-- configure spectre - TODO put this in the spectre plugin file somehow
vim.keymap.set("n", "<leader>ssw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
vim.keymap.set("v", "<leader>ssw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})


-- git commit message color codes
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
    -- Set 50 char limit for title, 72 for body
    vim.opt_local.textwidth = 72
    -- Highlight column 51 to warn about long titles
    vim.opt_local.colorcolumn = "51"
  end,
})

-- home key in insert mode goes to first non whitespace character
vim.api.nvim_set_keymap("i", "<Home>", "<C-o>^", { noremap = true, silent = true })

-- Ctrl+Delete and Ctrl+Backspace work in insert mode
vim.keymap.set("i", "<C-Del>", "<C-o>dw", { noremap = true, silent = true })
vim.keymap.set("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })

-- keep the visual lines selected after doing operations
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", "=", "=gv", { noremap = true, silent = true })

-- Make sure formatoptions stay consistent across filetypes
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		-- don't add comments when entering INSERT mode from NORMAL mode
		vim.opt_local.formatoptions:remove("o")
		-- only insert comments in INSERT mode
		vim.opt_local.formatoptions:append("r")
	end,
})


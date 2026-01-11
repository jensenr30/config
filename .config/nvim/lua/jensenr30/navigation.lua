vim.keymap.set("n", "<A-h>", "<C-o>", { desc = "Jump to previous location" })
vim.keymap.set("n", "<A-l>", "<C-i>", { desc = "Jump to next location" })

vim.keymap.set({ "n", "v", "i" }, "<A-o>", "<Esc>:LspClangdSwitchSourceHeader<CR>", { noremap = true, silent = true })

-- close current buffer without closing the window
vim.keymap.set("n", "<A-q>", function()
	if vim.bo.buftype == "" and not vim.bo.readonly then
		vim.cmd("write")
	end
	local buf_id = vim.api.nvim_get_current_buf()
	vim.cmd("bprevious")
	vim.api.nvim_buf_delete(buf_id, { force = false }) -- don't close the file if there are changes
end, { noremap = true, silent = true })


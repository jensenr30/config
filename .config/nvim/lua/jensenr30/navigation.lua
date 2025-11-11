local function close_floating_windows()
	for _, win in pairs(vim.api.nvim_list_wins()) do
		if vim.api.nvim_win_get_config(win).relative == "win" then
			vim.api.nvim_win_close(win, false)
		end
	end
end
vim.keymap.set("n", "<Esc>", close_floating_windows, { desc = "Close all floating Windows" })

vim.keymap.set("n", "<A-h>", "<C-o>", { desc = "Jump to previous location" })
vim.keymap.set("n", "<A-l>", "<C-i>", { desc = "Jump to next location" })

vim.keymap.set({ "n", "v", "i" }, "<A-o>", "<Esc>:LspClangdSwitchSourceHeader<CR>", { noremap = true, silent = true })

-- close current buffer without closing the window
vim.keymap.set("n", "q", function()
	if vim.bo.buftype == "" and not vim.bo.readonly then
		vim.cmd("write")
	end
	local buf_id = vim.api.nvim_get_current_buf()
	vim.cmd("bprevious")
	vim.api.nvim_buf_delete(buf_id, { force = false }) -- don't close the file if there are changes
end, { noremap = true, silent = true })


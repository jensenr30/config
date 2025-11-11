-- open terminal in insert mode (in the terminal)
vim.keymap.set("n", "<leader><CR>", ":TermOpen<CR>")
vim.api.nvim_create_user_command("TermOpen", function(opts)
	local target = opts.args
	vim.cmd("terminal " .. target)
	vim.cmd("normal! G")
	-- vim.cmd("startinsert")
end, {
	nargs = "*",
	desc = "Open terminal and run command (optional)",
})

-- build
vim.keymap.set("n", "<leader>bb", ":TermOpen build<CR>", { desc = "build" })
-- build run
vim.keymap.set("n", "<leader>br", ":TermOpen build && run<CR>", { desc = "run" })
-- built tests
vim.keymap.set("n", "<leader>bt", ":TermOpen build test<CR>", { desc = "build and run tests" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

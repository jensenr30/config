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

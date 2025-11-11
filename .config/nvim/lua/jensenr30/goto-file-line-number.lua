-- goto file:line_number  - accepts /path/to/my/File:123 - opens File & puts cursor on line 123
vim.keymap.set("n", "gf", function()
	local line = vim.api.nvim_get_current_line()
	-- TODO currently we just open the first valid file - but we should fix it so it selects the file underneath the user's cursor
	-- TODO use this: local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	--      then use the column information to tell if the
	--      but keep in mind this should work like this:
	--      priority:
	--      1. open the file under the cursor
	--      2. if there is no file under the cursor, open the nearest one
	--      we probably need to build a list of files under the cursor,
	--      and check if the cursor is within any valid file - if so open it and be done
	--      if not, we will have to search through the files to determine which is closest to the cursor.
	local file_pattern = "[-_%w%./\\]+%.[%w]+"
	vim.api.nvim_echo({ { "file_pattern: " .. file_pattern } }, true, {})
	for str in line:gmatch("(" .. file_pattern .. "%:?%d*)") do
		print("match in line: " .. str)
		local filepath, linenum = str:match("(" .. file_pattern .. "):?(%d*)")
		vim.api.nvim_echo({ { "filepath: " .. filepath } }, true, {})
		filepath = filepath or match
		if vim.fn.filereadable(filepath) == 1 then
			vim.cmd("edit " .. filepath)
			if linenum then
				vim.api.nvim_echo({ { "line num: " .. linenum } }, true, {})
				vim.cmd(linenum)
			end
			return
		else
			if filepath ~= nil then
				vim.api.nvim_echo({ { "File not found: " .. filepath, "ErrorMsg" } }, true, {})
			else
				vim.api.nvim_echo({ { "Bad str: " .. str, "ErrorMsg" } }, true, {})
			end
		end
	end
	vim.api.nvim_echo({ { "No valid file under cursor: " .. line, "ErrorMsg" } }, true, {})
end, { noremap = true, silent = true })

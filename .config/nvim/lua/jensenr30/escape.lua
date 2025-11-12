local function jensenr30_escape()

    -- 1. Close all floating windows
    local closed = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local cfg = vim.api.nvim_win_get_config(win)
        if cfg.relative ~= "" then
            vim.api.nvim_win_close(win, true)
            closed = true
        end
    end
    if closed then
        -- print("Closed floating windows")
        return
    end

    -- 2. Clear search highlight if active
    if vim.v.hlsearch == 1 then
        -- print("Disable search highlight")
        vim.cmd("nohlsearch")
        return
    end

    -- 3. Handle multicursor.nvim
    local ok, mc = pcall(require, "multicursor-nvim")
    if ok then
        if mc.hasCursors() then
            mc.clearCursors()
            -- print("Cleared multiple cursors")
            return
        end
    end

    -- Fallback: just send normal <Esc>
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
end

vim.keymap.set({ "n", "v" }, "<Esc>", jensenr30_escape, { silent = true })

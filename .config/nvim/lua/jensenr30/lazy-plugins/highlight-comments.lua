-- highlight TODO, NOTE, FIXME, etc
return
{
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        -- signs = false,
        highlight = {
            pattern = [[.*<(KEYWORDS)\s*]],
        },
        keywords = {
            FIX = {
                icon = " ", -- icon used for the sign, and in search results
                color = "error", -- can be a hex color, or a named color (see below)
                alt = { "fixme", "Fixme", "FixMe", "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                -- signs = false, -- configure signs for some keywords individually
            },
            TODO = { icon = " ", color = "warning", alt = { "todo", "Todo", "ToDo", "TODo" } },
            HACK = { icon = " ", color = "warning" },
            WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
            PERF = { icon = " ", color = "optimize", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "POLISH" } },
            NOTE = { icon = " ", color = "hint", alt = { "note", "INFO", "info", "Note" } },
        },
        colors = {
            warning = { "#c1980f" },
            optimize = { "#777777" },
        },
        search = {
            pattern = [[\b(KEYWORDS)\b]], -- overriding default: don't require a ':' character at the end
        },
    },
}

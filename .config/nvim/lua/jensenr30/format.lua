vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.c", "*.cpp", "*.h", "*.hpp", "*.cxx", "*.hxx" },
    callback = function(args)
        vim.lsp.buf.format({ bufnr = args.buf, async = false })
    end,
})

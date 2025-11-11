vim.lsp.config["clangd"] = {
    cmd = {
        "clangd",
        "--header-insertion=never",
        -- TODO configure clangd query driver only for PDL-RyanJensen
        "--query-driver=/usr/bin/arm-none-eabi-gcc",
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
}
vim.lsp.enable("clangd")


vim.lsp.enable("glsl_analyzer")


vim.lsp.config["lua_ls"] = {
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace",
            },
        },
    },
}
vim.lsp.enable("lua_ls")


vim.lsp.enable("pyright")



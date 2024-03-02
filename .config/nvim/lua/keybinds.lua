-- todo set up neovim

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('n', '<C-W>', ':q<CR>')


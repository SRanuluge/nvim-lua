require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls","tsserver", "pyright" }
})


local on_attach = function(_,_)

vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action,{})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

end
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
  on_attach = on_attach
}

lspconfig.tsserver.setup {
  on_attach = on_attach
}


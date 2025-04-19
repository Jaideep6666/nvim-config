return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.clangd.setup({})
        lspconfig.pyright.setup({})
        lspconfig.jdtls.setup({})
        lspconfig.ts_ls.setup({})
        lspconfig.html.setup({})
        lspconfig.cssls.setup({})
    end
}

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require('mason').setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { 
                    "clangd", -- C/C++
                    "jdtls", -- Java
                    "pylsp", -- Python
                    "ts_ls", -- JavaScript
                    "html", -- HTML
                    "cssls", --CSS
                },
                automatic_installation = false,
            })
        end
    },
}

return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        local jdtls_root_markers = { ".git", "mvnw", "gradlew", "build.gradle", "settings.gradle", ".classpath" }
        local jdtls_root_dir = require("lspconfig.util").root_pattern(unpack(jdtls_root_markers))

        lspconfig.jdtls.setup({
            cmd = { "/home/jaideep/.local/share/nvim/mason/bin/jdtls" },
            root_dir = jdtls_root_dir,
            settings = {
                java = {
                    configuration = {
                        -- Optional: JavaFX and PostgreSQL classpath fallback (useful if not using build tools)
                        runtimes = {
                            {
                                path = "/usr/lib/jvm/java-21-openjdk", -- or your custom JDK path
                            },
                        },
                    },
                },
            },
            init_options = {
                bundles = {},
            },
        })
        lspconfig.clangd.setup({})
        lspconfig.pylsp.setup({
        })
        -- lspconfig.pyright.setup({})
        lspconfig.ts_ls.setup({})
        lspconfig.html.setup({})
        lspconfig.cssls.setup({})
        -- vim.env.CLASSPATH = "/opt/javafx-sdk-24/lib/*:/opt/postgres-jar/postgresql-42.7.5.jar"
        local bufopts = { noremap = true, silent = true,}
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)

    end
}

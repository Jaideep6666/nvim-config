return {
    -- Mason: Manages installation of language servers
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require('mason').setup()
        end
        -- Automatically setup Mason
    },

    -- Mason-LSPconfig: Ensures servers are installed and integrates with Mason
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pyright",      -- Python
                    "clangd",       -- C and C++
                    "jdtls",        -- Java
                    "omnisharp",    -- C#
                    "eslint",     -- JavaScript
                    "html",         -- HTML
                    "cssls",        -- CSS
                    "ts_ls",
                },
                automatic_installation = true
            })
        end,
    },

    -- Neovim-LSPconfig: Configures language servers
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.pyright.setup({})
            lspconfig.clangd.setup({
                filetypes = {"c", "cpp", "objc", "objcpp" },
            }) 
            lspconfig.eslint.setup({})
            lspconfig.html.setup({
                cmd = { "vscode-html-language-server", "--stdio" },
            })
            lspconfig.cssls.setup({})
            -- TypeScript and JavaScript Language Server Setup
            lspconfig.ts_ls.setup({
            cmd = { "typescript-language-server", "--stdio" }, -- Ensure this points to the correct binary
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
            --root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
            settings = {
                javascript = {
                    format = {
                        enable = true,
                    },
                },
                typescript = {
                    format = {
                        enable = true,
                    },
                },
            },
            on_attach = function(client, bufnr)
                -- Optional: Disable tsserver formatting if using a different formatter
                client.server_capabilities.documentFormattingProvider = false

                -- Add any additional key bindings or LSP client configurations here
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            end,
            })
            lspconfig.jdtls.setup({
                cmd = {
                    -- Update the paths below based on your JDTLS installation
                    "java", -- Ensure 'java' is in your PATH, or provide the full path to the Java executable
                    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                    "-Dosgi.bundles.defaultStartLevel=4",
                    "-Declipse.product=org.eclipse.jdt.ls.core.product",
                    "-Dlog.level=ALL",
                    "-Xmx1G",
                    "-jar",
                    vim.fn.glob("C:/Users/msiva/AppData/Local/nvim-data/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar"),
                    "-configuration",
                    "C:/Users/msiva/AppData/Local/nvim-data/mason/packages/jdtls/config_win",
                    "-data",
                    vim.fn.stdpath("data") .. "/jdtls-workspace",
                },
                -- root_dir = lspconfig.util.root_pattern(".git", "pom.xml", "build.gradle"),
                settings = {
                    java = {
                        home = "C:/Program Files/Java/jdk-22", -- Optional: Update with your Java JDK path if necessary
                    },
                },
                on_attach = function(client, bufnr)
                    -- Define key bindings or other settings here
                    local bufopts = { noremap = true, silent = true, buffer = bufnr }
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
                end,
            })
            lspconfig.omnisharp.setup({
                cmd = {
                    vim.fn.stdpath("data") .. "\\mason\\bin\\omnisharp",
                    "--languageserver",
                    "--hostPID",
                    tostring(vim.fn.getpid()),
                    "-z",                         -- Runs in zero-config mode
                    "--hostPID", tostring(vim.fn.getpid()), -- Host process ID for communication
                    "DotNet:enablePackageRestore=false",    -- Disable NuGet restore
                    "--encoding", "utf-8",                  -- Encoding format
                    "--languageserver",                     -- Language server protocol
                    "Sdk:IncludePrereleases=true",          -- Include prerelease SDKs
                    "FormattingOptions:EnableEditorConfigSupport=true" -- EditorConfig support
                },
                filetypes = { "cs", "vb" }, -- Filetypes supported by OmniSharp
            }) 

            local bufopts = { noremap = true, silent = true,}
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)

            -- Automatically setup servers installed via Mason
        end,
    },
}

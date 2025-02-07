return {
    -- Autocompletion Plugin
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",        -- LSP source
            "hrsh7th/cmp-buffer",          -- Buffer source
            "hrsh7th/cmp-path",            -- Path source
            "saadparwaiz1/cmp_luasnip",    -- Snippet source
            "L3MON4D3/LuaSnip",            -- Snippet engine
            "rafamadriz/friendly-snippets", -- Predefined snippets
            "onsails/lspkind.nvim",        -- Icons in completion menu
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")

            -- Load friendly snippets
            require("luasnip/loaders/from_vscode").lazy_load()

            -- Setup nvim-cmp
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text", -- Show both symbol and text
                        maxwidth = 50,        -- Prevent popup from being too wide
                        ellipsis_char = "...", -- Truncate long entries
                    }),
                },
                experimental = {
                    ghost_text = true, -- Show inline ghost text
                },
                completion = {
                    autocomplete = {
                        cmp.TriggerEvent.InsertEnter,  -- Trigger completion on entering insert mode
                        cmp.TriggerEvent.TextChanged,  -- Trigger completion when text changes
                    },
                },
                preselect = cmp.PreselectMode.Item,  -- Automatically highlight first suggestion
                confirmation = {
                    behavior = cmp.ConfirmBehavior.Replace, -- Automatically replace text when confirming completion
                    select = true,  -- Select the completion item
                },
                window = {
                    completion = {
                        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },  -- Customize popup border style
                        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:Search",
                    },
                    documentation = {
                        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },  -- Customize documentation window style
                        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:Search",
                    },
                },
            })
        end,
    },
    -- LSP Configuration
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Setup LSP servers
            lspconfig.ts_ls.setup { capabilities = capabilities } -- TypeScript/JavaScript
            lspconfig.pyright.setup { capabilities = capabilities }  -- Python
            lspconfig.clangd.setup { capabilities = capabilities }   -- C/C++
            lspconfig.html.setup { capabilities = capabilities }     -- HTML
            lspconfig.cssls.setup { capabilities = capabilities }    -- CSS
            lspconfig.jsonls.setup { capabilities = capabilities }   -- JSON
        end,
    },
    -- Snippet Engine and Snippet Collection
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        dependencies = {
            "rafamadriz/friendly-snippets", -- Predefined snippets
        },
        config = function()
            local luasnip = require("luasnip")
            -- Load friendly snippets
            require("luasnip/loaders/from_vscode").lazy_load()
            require("luasnip.loaders.from_lua").lazy_load({
                paths = { "C:/Users/msiva/AppData/Local/nvim/lua/snippets" },
            })
        end,
    },
    -- Icons for Completion Menu
    {
        "onsails/lspkind.nvim",
        config = function()
            require("lspkind").init({
                mode = "symbol_text", -- Show icons with text
                preset = "default",
                symbol_map = {
                    Text = "",
                    Method = "",
                    Function = "",
                    Constructor = "",
                    Field = "",
                    Variable = "",
                    Class = "",
                    Interface = "",
                    Module = "",
                    Property = "",
                    Unit = "",
                    Value = "",
                    Enum = "",
                    Keyword = "",
                    Snippet = "",
                    Color = "",
                    File = "",
                    Reference = "",
                    Folder = "",
                    EnumMember = "",
                    Constant = "",
                    Struct = "",
                    Event = "",
                    Operator = "",
                    TypeParameter = "",
                },
            })
        end,
    },
}
-- return {
--     -- Autocompletion Plugin
--     {
--         "hrsh7th/nvim-cmp",
--         dependencies = {
--             "hrsh7th/cmp-nvim-lsp",        -- LSP source
--             "hrsh7th/cmp-buffer",          -- Buffer source
--             "hrsh7th/cmp-path",            -- Path source
--             "saadparwaiz1/cmp_luasnip",    -- Snippet source
--             "L3MON4D3/LuaSnip",            -- Snippet engine
--             "rafamadriz/friendly-snippets", -- Predefined snippets
--             "onsails/lspkind.nvim",        -- Icons in completion menu
--         },
--     },
--     config = function()
--         local cmp = require("cmp")
--         local luasnip = require("luasnip")
--         local lspkind = require("lspkind")
--
--         -- Load friendly snippets
--         require("luasnip/loaders/from_vscode").lazy_load()
--
--         -- Setup nvim-cmp
--         cmp.setup({
--             snippet = {
--                 expand = function(args)
--                     luasnip.lsp_expand(args.body)
--                 end,
--             },
--             mapping = cmp.mapping.preset.insert({
--                 ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
--                 ["<Tab>"] = cmp.mapping(function(fallback)
--                     if cmp.visible() then
--                         cmp.select_next_item()
--                     elseif luasnip.expand_or_jumpable() then
--                         luasnip.expand_or_jump()
--                     else
--                         fallback()
--                     end
--                 end, { "i", "s" }),
--                 ["<S-Tab>"] = cmp.mapping(function(fallback)
--                     if cmp.visible() then
--                         cmp.select_prev_item()
--                     elseif luasnip.jumpable(-1) then
--                         luasnip.jump(-1)
--                     else
--                         fallback()
--                     end
--                 end, { "i", "s" }),
--             }),
--             sources = cmp.config.sources({
--                 { name = "nvim_lsp" },
--                 { name = "luasnip" },
--                 { name = "buffer" },
--                 { name = "path" },
--             }),
--             formatting = {
--                 format = lspkind.cmp_format({
--                     mode = "symbol_text", -- Show both symbol and text
--                     maxwidth = 50,        -- Prevent popup from being too wide
--                     ellipsis_char = "...", -- Truncate long entries
--                 }),
--             },
--             experimental = {
--                 ghost_text = true, -- Show inline ghost text
--             },
--             completion = {
--                 autocomplete = {
--                     cmp.TriggerEvent.InsertEnter,  -- Trigger completion on entering insert mode
--                     cmp.TriggerEvent.TextChanged,  -- Trigger completion when text changes
--                 },
--             },
--             preselect = cmp.PreselectMode.Item,  -- Automatically highlight first suggestion
--             confirmation = {
--                 behavior = cmp.ConfirmBehavior.Replace, -- Automatically replace text when confirming completion
--                 select = true,  -- Select the completion item
--             },
--             window = {
--                 completion = {
--                     border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },  -- Customize popup border style
--                     winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:Search",
--                 },
--                 documentation = {
--                     border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },  -- Customize documentation window style
--                     winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:Search",
--                 },
--             },
--         })
--     end,
--     -- LSP Configuration
--     {
--         "neovim/nvim-lspconfig",
--         config = function()
--             local lspconfig = require("lspconfig")
--             local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
--             -- Setup LSP servers
--             lspconfig.ts_ls.setup { capabilities = capabilities } -- TypeScript/JavaScript
--             lspconfig.pyright.setup { capabilities = capabilities }  -- Python
--             lspconfig.clangd.setup { capabilities = capabilities }   -- C/C++
--             lspconfig.html.setup { capabilities = capabilities }     -- HTML
--             lspconfig.cssls.setup { capabilities = capabilities }    -- CSS
--             lspconfig.jsonls.setup { capabilities = capabilities }   -- JSON
--         end,
--     },
--
--     -- Snippet Engine and Snippet Collection
--     {
--         "L3MON4D3/LuaSnip",
--         build = "make install_jsregexp",
--         dependencies = {
--             "rafamadriz/friendly-snippets", -- Predefined snippets
--         },
--         config = function()
--             local luasnip = require("luasnip")
--
--             -- Load friendly snippets
--             require("luasnip/loaders/from_vscode").lazy_load()
--
--             require("luasnip.loaders.from_lua").lazy_load({
--                 paths = { "C:/Users/msiva/AppData/Local/nvim/lua/snippets" },
--             })
--
--             -- Optional keybindings for snippet expansion and navigation
--             vim.keymap.set({ "i", "s" }, "<Tab>", function()
--                 if luasnip.expand_or_jumpable() then
--                     luasnip.expand_or_jump()
--                 else
--                     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", true)
--                 end
--             end, { silent = true })
--
--             vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
--                 if luasnip.jumpable(-1) then
--                     luasnip.jump(-1)
--                 end
--             end, { silent = true })
--         end,
--     },
--
--     -- Icons for Completion Menu
--     {
--         "onsails/lspkind.nvim",
--         config = function()
--             require("lspkind").init({
--                 mode = "symbol_text", -- Show icons with text
--                 preset = "default",
--                 symbol_map = {
--                     Text = "",
--                     Method = "",
--                     Function = "",
--                     Constructor = "",
--                     Field = "",
--                     Variable = "",
--                     Class = "",
--                     Interface = "",
--                     Module = "",
--                     Property = "",
--                     Unit = "",
--                     Value = "",
--                     Enum = "",
--                     Keyword = "",
--                     Snippet = "",
--                     Color = "",
--                     File = "",
--                     Reference = "",
--                     Folder = "",
--                     EnumMember = "",
--                     Constant = "",
--                     Struct = "",
--                     Event = "",
--                     Operator = "",
--                     TypeParameter = "",
--                 },
--             })
--         end,
--     },
-- }



-- -- Snippet Engine and Snippet Collection
--    {
    --        "L3MON4D3/LuaSnip",
    --        dependencies = {
        --            "rafamadriz/friendly-snippets", -- Predefined snippets
        --        },
        --        config = function()
            --            -- Load friendly snippets
            --            require("luasnip/loaders/from_vscode").lazy_load()
            --        end,
            --    },

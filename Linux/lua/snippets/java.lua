local ls = require("luasnip") -- Load LuaSnip
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Define Java snippets
ls.add_snippets("java", {
    -- sout -> System.out.println();
    s("sout", {
        t("System.out.println("),
        i(1, ""), -- Insert placeholder for text
        t(");"),
    }),
    -- Optional: soutv for printing variables
    s("soutv", {
        t('System.out.println("'), t(" + "), t(");"),
    }),
})

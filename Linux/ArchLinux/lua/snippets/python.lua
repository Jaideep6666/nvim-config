local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Example: A simple "for" loop snippet
ls.add_snippets('python', {
    s('for', {
        t('for '), i(1, 'i'), t(' in range('), i(2, 'n'), t('):'),
        t({'', '    '}), i(0),
    }),
})

-- Example: A "function" snippet
ls.add_snippets('python', {
    s('func', {
        t('def '), i(1, 'function_name'), t('('), i(2, 'args'), t('):'),
        t({'', '    '}), i(0),
    }),
})

-- Example: A "main" snippet
ls.add_snippets('python', {
    s('main', {
        t({ 'if __name__ == "__main__":', '    ' }), i(0),
    }),
})

ls.add_snippets('python', {
    s('meth', {
        t('methods=["GET", "POST"]'),
    }),
})

-- DB Commit snippet
ls.add_snippets('python', {
    s('comm', {
        t('db.session.commit()'),
    }),
})

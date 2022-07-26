local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local r = require("luasnip.extras").rep
local fmt = require('luasnip.extras.fmt').fmt

-- ls.add_snippets('typescriptreact',
--                 {s('req', fmt("const {} = require('{}')", {i(1), r(1)}))})

ls.add_snippets('typescriptreact', {
  --
  -- s('clg', fmt("console.log(`{}: ${{{}}}`)", {i(1), r(1)}))
})

local snippets = require("luasnip")
local format = require("luasnip.extras.fmt").fmt

return {
    snippets.s(
        "rebase", format("rebase({}): {}", {
            snippets.i(1, "scope"),
            snippets.i(2, "message"),
        })
    ),
}

local snippets = require("luasnip")
local format = require("luasnip.extras.fmt").fmt

return {
    snippets.s(
        "sphcode", format("``{}``", {snippets.i(1, "default")})
    ),
}

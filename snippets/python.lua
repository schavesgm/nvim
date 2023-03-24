local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

return {
    ls.s("sphcode", fmt("``{}``", {ls.i(1, "default")})),
}

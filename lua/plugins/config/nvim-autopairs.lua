local present_1, autopairs = pcall(require, "nvim-autopairs")
local present_2, cmp = pcall(require, "cmp")
if not (present_1 and present_2) then return end

autopairs.setup{
    -- Check using treesitter
    check_ts = true,
    ts_config = {
        lua = {"string", "source"},
    },
    disable_filetype = {"TelescopePrompt", "spectre_panel"},
    fast_wrap = {
        map = "<C-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
    },
}

-- Hook onto cmp to close parenthesis on autocompletion
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {map_char = {tex = ""}})

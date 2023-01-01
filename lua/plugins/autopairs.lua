local M = {
    "windwp/nvim-autopairs",
    dependencies = "nvim-cmp",
}

function M.config()
    local is_autopairs_present, autopairs = pcall(require, "nvim-autopairs")
    if not is_autopairs_present then return end
    local is_cmp_present, cmp = pcall(require, "cmp")
    if not is_cmp_present then return end

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
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {map_char = {tex = ""}})
end

return M

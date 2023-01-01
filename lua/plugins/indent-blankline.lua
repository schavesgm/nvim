local M = {
    "lukas-reineke/indent-blankline.nvim",
}

function M.init()
    vim.keymap.set("n", "<leader>cc",
        function()
            local ok, start = require("indent_blankline.utils").get_current_context(
                vim.g.indent_blankline_context_patterns,
                vim.g.indent_blankline_use_treesitter_scope
            )

            if ok then
                vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
                vim.cmd [[normal! _]]
            end
        end
    )
end

function M.config()
    local is_present, plugin = pcall(require, "indent_blankline")
    if not is_present then return end

    plugin.setup({
        indentLine_enabled = 1,
        filetype_exclude = {
            "help",
            "terminal",
            "alpha",
            "packer",
            "lspinfo",
            "TelescopePrompt",
            "TelescopeResults",
            "mason",
            "",
        },
        buftype_exclude = { "terminal" },
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
    })
end

return M

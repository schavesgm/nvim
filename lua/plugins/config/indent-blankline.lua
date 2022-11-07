local present, plugin = pcall(require, "indent_blankline")
if not present then return end

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

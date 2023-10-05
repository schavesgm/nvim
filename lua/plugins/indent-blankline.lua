local M = {
    "lukas-reineke/indent-blankline.nvim",
}

function M.init()
    local is_kanagawa_present, _ = pcall(require, "kanagawa")
    if not is_kanagawa_present then return end
    local colours = require("kanagawa.colors").setup().palette
    vim.api.nvim_set_hl(0, "IblIndent", { bg = nil, fg = colours.sumiInk4, bold = false })
    vim.api.nvim_set_hl(0, "IblScope", { bg = nil, fg = colours.springViolet1, bold = false })
end

function M.config()
    local is_present, plugin = pcall(require, "ibl")
    if not is_present then return end
    plugin.setup()
end

return M

local M = {
    "rebelot/kanagawa.nvim",
}

-- Configure the plugin
function M.config()
    local is_present, plugin = pcall(require, "kanagawa")
    if not is_present then return end

    -- Setup kanagawa module
    plugin.setup {}

    -- Set kanagawa as the colourscheme of the system
    vim.cmd [[colorscheme kanagawa]]

    -- Set some custom highlights on this colourscheme
    local colors = require("kanagawa.colors").setup()
    vim.api.nvim_set_hl(0, 'WinSeparator',               {bg=nil, fg=colors.palette.crystalBlue, bold=true})
    vim.api.nvim_set_hl(0, 'IndentBlanklineChar',        {bg=nil, fg=colors.palette.sumiInk2, bold=true})
    vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', {bg=nil, fg=colors.palette.oniViolet, bold=true})
    vim.api.nvim_set_hl(0, 'DiagnosticError',            {bg=nil, fg=colors.palette.springViolet1, bold=false})
    vim.api.nvim_set_hl(0, 'DiagnosticWarn',             {bg=nil, fg=colors.palette.springViolet1, bold=false})
    vim.api.nvim_set_hl(0, 'DiagnosticInfo',             {bg=nil, fg=colors.palette.springViolet1, bold=false})
    vim.api.nvim_set_hl(0, 'DiagnosticHint',             {bg=nil, fg=colors.palette.springViolet1, bold=false})
end

return M

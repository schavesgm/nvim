local M = {
    "rebelot/kanagawa.nvim",
}

-- Configure the plugin
function M.config()
    local kanagawa = require("kanagawa")
    local colors = require("kanagawa.colors").setup()

    -- Setup kanagawa module
    kanagawa.setup{}

    -- Set kanagawa as the colourscheme of the system
    vim.cmd [[colorscheme kanagawa]]

    -- Set some custom highlights on this colourscheme
    vim.api.nvim_set_hl(0, 'WinSeparator',               {bg=nil, fg=colors.crystalBlue, bold=true})
    vim.api.nvim_set_hl(0, 'IndentBlanklineChar',        {bg=nil, fg=colors.sumiInk2, bold=true})
    vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', {bg=nil, fg=colors.oniViolet, bold=true})
    vim.api.nvim_set_hl(0, 'DiagnosticError',            {bg=nil, fg=colors.springViolet1, bold=false})
    vim.api.nvim_set_hl(0, 'DiagnosticWarn',             {bg=nil, fg=colors.springViolet1, bold=false})
    vim.api.nvim_set_hl(0, 'DiagnosticInfo',             {bg=nil, fg=colors.springViolet1, bold=false})
    vim.api.nvim_set_hl(0, 'DiagnosticHint',             {bg=nil, fg=colors.springViolet1, bold=false})
end

return M

local M = {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
        "numToStr/Comment.nvim",
        "nvim-telescope/telescope.nvim",
    }
}

function M.init()
	vim.keymap.set("n", "<leader>n", ":Navbuddy<Cr>")
end

function M.config()
    local is_present, plugin = pcall(require, "nvim-navbuddy")
    if not is_present then return end
    plugin.setup({
        icons = {
            File          = " ",
            Module        = " ",
            Namespace     = " ",
            Package       = " ",
            Class         = " ",
            Method        = " ",
            Property      = " ",
            Field         = " ",
            Constructor   = " ",
            Enum          = "󰕘",
            Interface     = "󰕘",
            Function      = "󰊕 ",
            Variable      = "󰆧 ",
            Constant      = "󰏿 ",
            String        = " ",
            Number        = "󰎠 ",
            Boolean       = "◩ ",
            Array         = "󰅪 ",
            Object        = "󰅩 ",
            Key           = "󰌋 ",
            Null          = "󰟢 ",
            EnumMember    = " ",
            Struct        = "󰌗 ",
            Event         = " ",
            Operator      = "󰆕 ",
            TypeParameter = "󰊄 ",
        },
    })
end

return M

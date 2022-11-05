-- File containing all the default plugins of the system
-- TODO: Plugins don't load their configuration

return {
    -- Initialisation plugins
    ["lewis6991/impatient.nvim"] = {},

    -- Colourschemes
    ["rebelot/kanagawa.nvim"] = {
        config = function() require("plugins.kanagawa") end,
    },

    -- Treesitter plugins
    ["nvim-treesitter/nvim-treesitter"] = {
        module = "nvim-treesitter",
        setup = function() require("core.lazy_load").on_file_open("nvim-treesitter") end,
        cmd = require("core.lazy_load").treesitter_cmds,
        run = ":TSUpdate",
        config = function() require("plugins.nvim-treesitter") end,
    },
    ['nvim-treesitter/playground'] = {
        requires = 'nvim-treesitter/nvim-treesitter',
        ensure_dependencies = true,
        cmd = 'TSPlaygroundToggle',
        config = function() require("nvim-treesitter.configs").setup{} end,
    },

    -- Lsp plugins
    ["williamboman/mason.nvim"] = {
        config = function() require("plugins.mason") end,
    },
    ["neovim/nvim-lspconfig"] = {
        opt = true,
        setup = function() require("core.lazy_load").on_file_open("nvim-lspconfig") end,
        config = function() require("lsp") end,
    },
    ["williamboman/mason-lspconfig.nvim"] = {
        config = function() require("plugins.mason-lspconfig") end,
    },

    -- Statusline
    ['feline-nvim/feline.nvim'] = {
        config = function() require("plugins.feline") end,
        requires={
            {'kyazdani42/nvim-web-devicons', opts=true},
            {'lewis6991/gitsigns.nvim', opts=true},
        },
        ensure_dependencies=true,
    },

}

-- File containing all the default plugins of the system
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

    -- Autocompletion and snippets
    ["rafamadriz/friendly-snippets"] = {
        module = {"cmp", "cmp_nvim_lsp"},
        event = "InsertEnter",
    },
    ["hrsh7th/nvim-cmp"] = {
        after = "friendly-snippets",
        config = function() require("plugins.nvim-cmp") end,
    },
    ["L3MON4D3/LuaSnip"] = {
        wants = "friendly-snippets",
        after = "nvim-cmp",
        config = function() require("plugins.luasnip") end,
    },
    ["saadparwaiz1/cmp_luasnip"] = {
        after = "LuaSnip"
    },
    ["hrsh7th/cmp-nvim-lua"] = {
        after = "cmp_luasnip"
    },
    ["hrsh7th/cmp-nvim-lsp"] = {
        after = "cmp-nvim-lua"
    },
    ["hrsh7th/cmp-buffer"] = {
        after = "cmp-nvim-lsp"
    },
    ["hrsh7th/cmp-path"] = {
        after = "cmp-buffer"
    },
    ["kdheepak/cmp-latex-symbols"] = {
        after = "cmp-path"
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

    -- Utility plugins
    ["windwp/nvim-autopairs"] = {
        after = "nvim-cmp",
        config = function() require("plugins.nvim-autopairs") end,
    },
    ["lukas-reineke/indent-blankline.nvim"] = {
        opt = true,
        setup = function() require("core.lazy_load").on_file_open("indent-blankline.nvim") end,
        config = function() require("plugins.indent-blankline") end,
    },
}

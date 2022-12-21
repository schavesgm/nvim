-- File containing all the default plugins of the system
return {
    -- Initialisation plugins
    ["lewis6991/impatient.nvim"] = {},

    -- Colourschemes
    ["rebelot/kanagawa.nvim"] = {
        config = function() require("plugins.config.kanagawa") end,
    },

    -- Treesitter plugins
    ["nvim-treesitter/nvim-treesitter"] = {
        module = "nvim-treesitter",
        setup = function() require("core.lazy_load").on_file_open("nvim-treesitter") end,
        cmd = require("core.lazy_load").treesitter_cmds,
        run = ":TSUpdate",
        config = function() require("plugins.config.nvim-treesitter") end,
    },
    ['nvim-treesitter/playground'] = {
        requires = 'nvim-treesitter/nvim-treesitter',
        ensure_dependencies = true,
        cmd = 'TSPlaygroundToggle',
        config = function() require("nvim-treesitter.configs").setup{} end,
    },
    ['p00f/nvim-ts-rainbow'] = {
        after = "nvim-treesitter"
    },

    -- Lsp plugins
    ["williamboman/mason.nvim"] = {
        config = function() require("plugins.config.mason") end,
    },
    ["neovim/nvim-lspconfig"] = {
        opt = true,
        setup = function() require("core.lazy_load").on_file_open("nvim-lspconfig") end,
        config = function() require("lsp") end,
    },
    ["williamboman/mason-lspconfig.nvim"] = {
        config = function() require("plugins.config.mason-lspconfig") end,
    },
    ["ray-x/lsp_signature.nvim"] = {
        after = "nvim-lspconfig",
    },
    ["weilbith/nvim-code-action-menu"] = {
        cmd = 'CodeActionMenu',
    },

    -- Autocompletion and snippets
    ["rafamadriz/friendly-snippets"] = {
        module = {"cmp", "cmp_nvim_lsp"},
        event = "InsertEnter",
    },
    ["hrsh7th/nvim-cmp"] = {
        after = "friendly-snippets",
        config = function() require("plugins.config.nvim-cmp") end,
    },
    ["L3MON4D3/LuaSnip"] = {
        wants = "friendly-snippets",
        after = "nvim-cmp",
        config = function() require("plugins.config.luasnip") end,
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
    ["petertriho/cmp-git"] = {
        config = function() require("plugins.config.nvim_git") end,
        after = "cmp-latex-symbols",
        requires = "nvim-lua/plenary.nvim",
    },

    -- Git plugins
    ["lewis6991/gitsigns.nvim"] = {
        ft = "gitcommit",
        setup = function() require("core.lazy_load").gitsigns() end,
        config = function() require("plugins.config.gitsigns") end,
    },
    ["TimUntersberger/neogit"] = {
        cmd = "Neogit",
        requires = "nvim-lua/plenary.nvim",
        config = function() require("plugins.config.neogit") end,
    },

    -- Telescope
    ["nvim-telescope/telescope.nvim"] = {
        cmd = {"Telescope"},
        requires = {
            {'nvim-lua/plenary.nvim', opts=true},
            {'nvim-lua/popup.nvim', opts=true},
        },
        ensure_dependencies=true,
        config = function() require("plugins.config.telescope") end,
        setup = function() require("plugins.setup.telescope") end,
    },
    ['nvim-telescope/telescope-media-files.nvim'] = {
        cmd = {"Telescope"}
    },

    -- File navigation
    ["kyazdani42/nvim-tree.lua"] = {
        cmd = {"NvimTreeToggle", "NvimTreeFocus"},
        config = function() require("plugins.config.nvimtree") end,
        setup = function() require("plugins.setup.nvimtree") end,
    },

    -- Statusline
    ['feline-nvim/feline.nvim'] = {
        config = function() require("plugins.config.feline") end,
        requires={
            {'kyazdani42/nvim-web-devicons', opts=true},
            {'lewis6991/gitsigns.nvim', opts=true},
        },
        ensure_dependencies=true,
    },

    -- Utility plugins
    ["windwp/nvim-autopairs"] = {
        after = "nvim-cmp",
        config = function() require("plugins.config.nvim-autopairs") end,
    },
    ["lukas-reineke/indent-blankline.nvim"] = {
        opt = true,
        setup = function()
            require("core.lazy_load").on_file_open("indent-blankline.nvim")
            require("plugins.setup.indent-blankline")
        end,
        config = function() require("plugins.config.indent-blankline") end,
    },

    -- Miscellanea
    ["kyazdani42/nvim-web-devicons"] = {
        module = "nvim-web-devicons",
        config = function() require("plugins.config.devicons") end,
    },
    ['mechatroner/rainbow_csv'] = {
        ft = "csv",
    }
}

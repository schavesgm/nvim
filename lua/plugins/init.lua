-- Plugins that do not require configuration
return {
    -- Initialisation plugins
    {
        "lewis6991/impatient.nvim"
    },

    -- Treesitter plugins
    {
        "nvim-treesitter/playground",
        dependencies = "nvim-treesitter/nvim-treesitter",
        cmd = "TSPlaygroundToggle",
        config = function()
            require("nvim-treesitter.configs").setup{}
        end,
    },
    {
        "p00f/nvim-ts-rainbow",
        dependencies = "nvim-treesitter"
    },

    -- LSP plugins
    {
        "ray-x/lsp_signature.nvim",
        dependencies = "nvim-lspconfig",
    },
    {
        "weilbith/nvim-code-action-menu",
        cmd = 'CodeActionMenu',
    },

    -- Autocompletion and snippets
    {
        "rafamadriz/friendly-snippets",
        event = "InsertEnter",
    },
    {
        "saadparwaiz1/cmp_luasnip",
        dependencies = "LuaSnip",
    },
    {
        "hrsh7th/cmp-nvim-lua",
        dependencies = "LuaSnip"
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        dependencies = "LuaSnip",
    },
    {
        "hrsh7th/cmp-buffer",
        dependencies = "LuaSnip"
    },
    {
        "hrsh7th/cmp-path",
        dependencies = "LuaSnip",
    },
    {
        "kdheepak/cmp-latex-symbols",
        dependencies = "LuaSnip"
    },

    -- Git plugins
    {
        "TimUntersberger/neogit",
        cmd = "Neogit",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            local is_present, plugin = pcall(require, "neogit")
            if not is_present then return end
            plugin.setup{}
        end
    },

    -- Quickfix
    {
        "kevinhwang91/nvim-bqf",
        ft = "qf",
    },

    -- Miscellanea
    {
        "mechatroner/rainbow_csv",
        ft = "csv",
    },
    {
        "famiu/bufdelete.nvim",
        cmd = {"Bdelete", "Bwipeout"},
    },
    {
        "junegunn/fzf",
        build = function()
            vim.fn['fzf#install']()
        end,
    },
    {
        "j-hui/fidget.nvim",
        depedendencies = "nvim-lspconfig",
        config = function()
            local is_present, plugin = pcall(require, "fidget")
            if not is_present then return end
            plugin.setup()
        end
    },

    -- Markup languages
    {
        "schavesgm/partex.nvim",
        ft = "tex",
        config = function()
            local is_present, plugin = pcall(require, "partex")
            if not is_present then return end
            plugin.setup()
        end,
    },
}

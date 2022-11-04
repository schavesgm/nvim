-- File containing all the default plugins of the system
return {
    -- Initialisation plugins
    ["lewis6991/impatient.nvim"] = {},

    -- Treesitter plugins
    ["nvim-treesitter/nvim-treesitter"] = {
        module = "nvim-treesitter",
        setup = function() require("core.lazy_load").on_file_open("nvim-treesitter") end,
        cmd = require("core.lazy_load").treesitter_cmds,
        run = ":TSUpdate",
        config = function() require("plugins.nvim-treesitter") end,
    },
    ['nvim-treesitter/playground'] = {
        requires='nvim-treesitter/nvim-treesitter',
        ensure_dependencies=true,
        cmd='TSPlaygroundToggle',
        config=function() require"nvim-treesitter.configs".setup{} end,
    },
}

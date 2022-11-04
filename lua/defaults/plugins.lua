-- File containing all the default plugins of the system
return {
    {
        "wbthomason/packer.nvim",
    },
    {
        "lewis6991/impatient.nvim",
    },
    {
       "nvim-treesitter/nvim-treesitter",
        module = "nvim-treesitter",
        setup = function() require("core.lazy_load").on_file_open("nvim-treesitter") end,
        cmd = require("core.lazy_load").treesitter_cmds,
        run = ":TSUpdate",
        config = function() require("plugins.nvim-treesitter") end,
    },
}


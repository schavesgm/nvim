-- File containing all the default plugins of the system
return {
    -- First, initialise Packer
    {
        "wbthomason/packer.nvim",
    },
    {
        "lewis6991/impatient.nvim",
    },
    {
        "antoinemadec/FixCursorHold.nvim",
        event = { "BufRead", "BufNewFile" },
    },
}

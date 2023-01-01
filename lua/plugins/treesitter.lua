local M = {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    cmd = {"TSInstall", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo"},
    build = ":TSUpdate",
}

-- Configure the plugin
function M.config()
    local is_present, treesitter = pcall(require, "nvim-treesitter.configs")
    if not is_present then return end

    treesitter.setup {
        ensure_installed = {"lua", "vim"},
        sync_install = true,
        auto_install = true,

        -- Treesitter highlighting module
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
            use_languagetree = true,
        },

        -- Treesitter indentation module
        indent = {
            enable = true,
        },

        -- External modules
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = 1000,
        },
        autopairs = {
            enable = true
        },
    }
end

return M

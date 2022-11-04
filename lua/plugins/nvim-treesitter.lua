local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then return end

treesitter.setup {
    ensure_installed = {"lua"},
    sync_install = true,

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
}

--Define the autocommand to install TreeSitter parser
local group = vim.api.nvim_create_augroup("TreeSitterInstall", {clear=true})
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        local status_ok, parser = pcall(vim.treesitter.get_parser)
        if not status_ok then
            if string.find(parser, "no parser for") then
                local ft = vim.bo.filetype
                vim.notify(string.format("Parser for %s language not found. Installing.", ft))
                vim.cmd(":TSInstall " .. ft)
            end
        end
    end
})

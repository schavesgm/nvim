local M = {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
}

function M.init()
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "<leader>ng", ":lua require('neogen').generate()<CR>", opts)
end

function M.config()
    local is_present, plugin = pcall(require, "neogen")
    if not is_present then return end

    plugin.setup {
        enabled = true,
        snippet_engine = "luasnip",
        languages = {
            python = {
                template = {
                    annotation_convention = "google_docstrings"
                }
            }
        }
    }
end

return M

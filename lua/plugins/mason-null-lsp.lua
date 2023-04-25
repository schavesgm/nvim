local M = {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
        "jose-elias-alvarez/null-ls.nvim",
        "williamboman/mason.nvim",
    },
}

function M.config()
    local is_mason_null_present, mason_null = pcall(require, "mason-null-ls")
    if not is_mason_null_present then return end
    local is_null_present, null_ls = pcall(require, "null-ls")
    if not is_null_present then return end

    mason_null.setup {
        handlers = {
            stylua = function(_, _)
                null_ls.register(null_ls.builtins.formatting.stylua)
            end,
            prettier = function(_, _)
                null_ls.register(null_ls.builtins.formatting.prettier)
            end,
            yamllint = function(_, _)
                null_ls.register(null_ls.builtins.diagnostics.yamllint)
            end,
            fixjson = function(_, _)
                null_ls.register(null_ls.builtins.formatting.fixjson)
            end,
            hadolint = function(_, _)
                null_ls.register(null_ls.builtins.diagnostics.hadolint)
            end
        }
    }
    null_ls.setup {
        on_attach = function()
            require("lsp.utils").lsp_keymaps(vim.api.nvim_get_current_buf())
        end
    }
end

return M

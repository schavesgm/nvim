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
            -- Python handlers
            mypy = function(_, _)
                null_ls.register(
                    null_ls.builtins.diagnostics.mypy.with {
                        extra_args = {
                            "--show-column-numbers",
                            "--disallow-untyped-defs",
                            "--check-untyped-defs",
                            "--ignore-missing-imports",
                        }
                    }
                )
            end,
            flake8 = function(_, _)
                null_ls.register(
                    null_ls.builtins.diagnostics.flake8.with {
                        args = {
                            "--max-line-length 100",
                            "--max-cognitive-complexity 15",
                            "--extend-ignore E203,E266,W503,B028",
                            "--format",
                            "default",
                            "--stdin-display-name",
                            "$FILENAME",
                            "-",
                        }
                    }
                )
            end,
            -- pylint = function(_, _)
            --     null_ls.register(null_ls.builtins.diagnostics.pylint.with{
            --         extra_args = {"--disable=import-error"},
            --     })
            -- end,
            isort = function(_, _)
                null_ls.register(null_ls.builtins.formatting.isort)
            end,
            black = function(_, _)
                null_ls.register(null_ls.builtins.formatting.black.with {
                    extra_args = { "--line-length=100" }
                })
            end

            -- stylua = function(_, _)
            --     null_ls.register(null_ls.builtins.formatting.stylua)
            -- end,
            -- prettier = function(_, _)
            --     null_ls.register(null_ls.builtins.formatting.prettier)
            -- end,
            -- yamllint = function(_, _)
            --     null_ls.register(null_ls.builtins.diagnostics.yamllint)
            -- end,
            -- fixjson = function(_, _)
            --     null_ls.register(null_ls.builtins.formatting.fixjson)
            -- end,
            -- hadolint = function(_, _)
            --     null_ls.register(null_ls.builtins.diagnostics.hadolint)
            -- end
        }
    }
    null_ls.setup {
        on_attach = function()
            require("lsp.utils").lsp_keymaps(vim.api.nvim_get_current_buf())
        end
    }
end

return M

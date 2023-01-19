-- Configuration of pylsp
return {
    on_init = function()
        vim.notify(
            "Diagnostics not showing? Run: pip install \"python-language-server[all]\" pylsp-mypy",
            vim.log.levels.WARN
        )
    end,
    settings = {
        pylsp = {
            configurationSources = { "pycodestyle" },
            plugins = {
                pylsp_black = {
                    enabled = true,
                    line_length = 100,
                    preview = true,
                },
                flake8 = {
                    enabled = true,
                    maxLineLength = 100,
                    ignore = { "E203", "E266", "E501", "E303", "W503", "E302" },
                },
                pycodestyle = {
                    enabled = true,
                    maxLineLength = 100,
                },
                pylsp_isort = {
                    enabled = true,
                },
                pylsp_mypy = {
                    enabled = true,
                },
                -- For some reason, this eliminates all other diagnostics
                -- pydocstyle = {
                --     enabled = false,
                --     convention = "google",
                -- },
            }
        }
    }
}

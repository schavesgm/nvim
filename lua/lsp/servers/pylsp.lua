-- Configuration of pylsp
print("I am here")
return {
    settings = {
        pylsp = {
            configurationSources = {"flake8"},
            plugins = {
                flake8 = {
                    enabled = true,
                    max_line_length = 100,
                    max_cognitive_complexity = 15,
                    ignore = {"E203", "E266", "E501", "E303", "W503", "E302"},
                },
                pyflakes = {
                    enabled = false,
                },
                pylint = {
                    enabled = true,
                    args = {"--py36-plus", "--py37-plus", "--py38-plus"},
                },
                pycodestyle = {
                    enabled = true,
                },
                pylsp_mypy = {
                    enabled = true,
                }
                -- For some reason, this eliminates all other diagnostics
                -- pydocstyle = {
                --     enabled = true,
                --     convention = "google",
                -- },
            }
        }
    }
}

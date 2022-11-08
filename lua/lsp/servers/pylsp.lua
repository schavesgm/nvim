-- Configuration of pylsp
return {
    settings = {
        pylsp = {
            plugins = {
                pydocstyle = {
                    enabled = true,
                    convention = "google",
                },
                flake8 = {
                    enabled = true,
                    max_line_length = 100,
                    max_cognitive_complexity = 15,
                    ignore = {"E203", "E266", "E501", "W503"},
                },
                pylint = {
                    enabled = true,
                    args = {"--py36-plus", "--py37-plus", "--py38-plus"},
                }
            }
        }
    }
}

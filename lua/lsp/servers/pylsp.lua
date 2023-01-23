-- Configuration of pylsp
return {
    settings = {
        pylsp = {
            configurationSources = { "flake8" },
            plugins = {
                -- Jedi plugin
                jedi_completion = {
                    enabled = true,
                },
                jedi_definition = {
                    enabled = true,
                },
                jedi_hover = {
                    enabled = true,
                },
                jedi_references = {
                    enabled = true,
                },
                jedi_signature_help = {
                    enabled = true,
                },
                jedi_symbols = {
                    enabled = true,
                },
                -- Autopep8
                autopep8 = {
                    enabled = false,
                },
                -- McCabe
                mccabe = {
                    enabled = true,
                    threshold = 15,
                },
                -- Preload
                preload = {
                    enabled = false,
                },
                -- PyCodestyle
                pycodestyle = {
                    enabled = true,
                    exclude = {"__init__.py"},
                    maxLineLength = 100,
                },
                -- PyDocStyle
                pydocstyle = {
                    enabled = true,
                    convention = "google",
                },
                -- PyFlakes
                pyflakes = {
                    enabled = true,
                },
                -- PyLint
                pylint = {
                    enabled = false,
                },
                -- Flake8
                flake8 = {
                    enabled = false,
                },
                -- MyPY
                pylsp_mypy = {
                    enabled = true,
                },
                -- Black
                pylsp_black = {
                    enabled = true,
                    line_length = 100,
                },
                -- Isort
                pylsp_isort = {
                    enabled = true,
                },
            }
        }
    }
}

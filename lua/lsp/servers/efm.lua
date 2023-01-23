local util = require("lspconfig").util

return {
    init_options = { documentFormatting = true },
    settings = {
        languages = {
            lua = {
                { formatCommand = "lua-format -i", formatStdin = true },
                { formatCommand = "lua-pretty -i" }
            },
            python = {
                {
                    lintSource = "flake8",
                    lintCommand = [[
                        flake8 --stdin-display-name ${INPUT} --max-line-length 100 --extend-ignore E203,E266,W503,B028
                    ]],
                    lintStdin = true,
                    lintFormats = { "%f:%l:%c: %m" }
                }
            }
        }

    },
    root_dir = util.root_pattern(".git", ".bashrc", "README.*", "."),
    filetypes = { "python", "lua" },
    single_file_support = false
}

local util = require("lspconfig").util

-- Table containing the arguments for a given command
local arguments = {
    flake8 = {
        "--stdin-display-name ${INPUT}",
        "--max-line-length 100",
        "--max-cognitive-complexity 15",
        "--extend-ignore E203,E266,W503,B028"
    },
    mypy = {
        "--show-column-numbers",
        "--disallow-untyped-defs",
        "--check-untyped-defs",
        "--ignore-missing-imports",
    },
    pylint = {
        "--output-format text",
        "--score no",
        "--msg-template {path}:{line}:{column}:{C}:{msg} ${INPUT}"
    },
}

---Generate the command of a given EFM target
---@param name string: Name of the command.
---@return string: Command to execute.
local function generate_command(name)
    local command = name
    for _, arg in ipairs(arguments[name]) do
        command = command .. " " .. arg
    end
    return command
end

return {
    init_options = { documentFormatting = true },
    settings = {
        languages = {
            lua = {
                { formatCommand = "lua-format -i", formatStdin = true },
                { formatCommand = "lua-pretty -i" }
            },
            python = {
                -- Linters
                {
                    lintSource = "flake8",
                    lintCommand = generate_command("flake8"),
                    lintStdin = true,
                    lintFormats = { "%f:%l:%c: %m" }
                },
                {
                    lintSource = "mypy",
                    lintCommand = generate_command("mypy"),
                    lintStdin = false,
                    lintFormats = {
                      "%f:%l:%c: %trror: %m",
                      "%f:%l:%c: %tarning: %m",
                      "%f:%l:%c: %tote: %m"
                    }
                },
                {
                    lintSource = "pylint",
                    lintCommand = generate_command("pylint"),
                    lintStdin = false,
                    lintFormats = {
                        "%f:%l:%c:%t:%m",
                    },
                    lintOffsetColumns = 1,
                    lintCategoryMap = {
                        I  = "H",
                        R  = "I",
                        C  = "I",
                        W  = "W",
                        E  = "E",
                        F  = "E",
                    }
                },
                -- Formatters
                {
                    formatCommand = "autopep8 -", formatStdin = true
                },
                {
                    formatCommand = "black --line-length=100 --quiet -", formatStdin = true,
                },
                {
                    formatCommand = "isort --quiet -", formatStdin = true,
                },
            }
        }

    },
    root_dir = util.root_pattern(".git", ".bashrc", "README.*", "."),
    filetypes = { "python", "lua" },
    single_file_support = true
}

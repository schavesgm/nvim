-- Local variable containing all the timed_autocommands
local timers = {}

-- Wrapper around a callback function to generate a timed loop
local function start_timed_callback(callback, start, every)
    return function()
        local bufnr = vim.api.nvim_buf_get_name(0)
        local lambda = vim.schedule_wrap(function() callback(bufnr) end)
        timers[bufnr] = vim.loop.new_timer()
        timers[bufnr]:start(start, every, lambda)
    end
end

-- Function that closes an already opened timed function
local function end_timed_callback()
    -- Get the current buffer name
    local bufnr = vim.api.nvim_buf_get_name(0)

    -- If the timer does exist, then close it
    if (timers[bufnr] ~= nil) then
        timers[bufnr]:close()
        timers[bufnr] = nil
    end
end

-- Small function to convert minutes to miliseconds
local function minutes_to_milisecodns(minutes) return minutes * 60 * 1000 end

-- Table containing all autogroups/autocommands definitions
return {
    BaseDefaults = {
        {
            event = "BufRead",
            opts = {
                pattern = "*",
                command = [[call setpos(".", getpos("'\""))]]
            }
        }, { event = "VimLeave", opts = { pattern = "*", command = "wshada!" } }
    },
    TerminalDefaults = {
        {
            event = "TermOpen",
            opts = {
                pattern = "*",
                command = [[tnoremap <buffer> <Esc> <c-\><c-n>]]
            }
        },
        { event = "TermOpen", opts = { pattern = "*", command = "startinsert" } },
        {
            event = "TermOpen",
            opts = {
                pattern = "*",
                command = [[setlocal nonumber norelativenumber]]
            }
        }, {
            event = "TermOpen",
            opts = { pattern = "*", command = [[setlocal filetype=term]] }
        },
        {
            event = "TermOpen",
            opts = { pattern = "*", command = [[setlocal spell!]] }
        }
    },
    MarkupDefaults = {
        {
            event = { "BufEnter", "WinEnter" },
            opts = {
                pattern = { "*.tex", "*.txt", "*.md" },
                command = [[setlocal textwidth=100 colorcolumn=+1]]
            }
        }, {
            event = "BufEnter",
            opts = {
                pattern = { "*.tex", "*.md" },
                callback = start_timed_callback(function(bufnr)
                    vim.cmd(':w ' .. bufnr)
                end, minutes_to_milisecodns(3), minutes_to_milisecodns(3))
            }
        }, {
            event = "BufLeave",
            opts = { pattern = { "*.tex", "*.md" }, callback = end_timed_callback }
        }
    },
    PythonDefaults = {
        {
            event = { "FileType" },
            opts = {
                pattern = "python",
                callback = function()
                    local install_python_dev = function()
                        local packages = {
                            "flake8", "pep8-naming", "flake8-builtins",
                            "flake8-comprehensions", "flake8-bugbear",
                            "flake8-pytest-style",
                            "flake8-cognitive-complexity", "pydocstyle",
                            "pylint", "pyupgrade", "prettier", "mypy", "black",
                            "isort"
                        }
                        vim.cmd("!pip install --upgrade pip")
                        for _, package in ipairs(packages) do
                            vim.cmd(string.format("!pip install %s", package))
                        end
                    end
                    vim.api.nvim_create_user_command("InstallPythonDevLsp", install_python_dev, {})
                end
            }
        }
    }
}

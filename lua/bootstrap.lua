-- Module used to bootstrap the configuration of gruvim
local M = {}

-- Vim has to be 0.8 at least
if vim.fn.has "nvim-0.8" ~= 1 then
    vim.notify("Please upgrade your Neovim base installation. Requires v0.7+", vim.log.levels.WARN)
    vim.wait(5000, function() return false end)
    vim.cmd "cquit"
end

-- Builtin plugins to deactivate
local disabled_built_ins = {
    "2html_plugin",
    "gzip",
    "matchit",
    "rrhelper",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "logipat",
    "spellfile_plugin",
    -- "netrw",
    -- "netrwPlugin",
    -- "netrwSettings",
    -- "netrwFileHandlers",
}
for _, plugin in ipairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = true
end

---Initialise the configuration.
function M:init()

    -- Initialise the options module
    require("core.options"):init(require("defaults.options"))

    -- Initialise the keymaps module
    require("core.keymaps"):init(require("defaults.keymaps"))

    -- Initialise the autocommands module
    require("core.autocmds"):init(require("defaults.autocmds"))

    -- Initialise the plugins
    require("core.plugins"):init(require("defaults.plugins"))

end

---Reload the neovim configuration
function M:reload()
    M:init()
end

return M

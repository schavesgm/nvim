-- Module used to bootstrap the configuration of gruvim
local M = {}

-- Vim has to be 0.8 at least
if vim.fn.has "nvim-0.8" ~= 1 then
    vim.notify("Please upgrade your Neovim base installation. Requires v0.7+", vim.log.levels.WARN)
    vim.wait(5000, function() return false end)
    vim.cmd "cquit"
end

-- Load the default configuration
local plugins = require("defaults.plugins")

function M:init()

    -- Initialise the plugins
    require("core.plugins"):init(plugins)


end

return M

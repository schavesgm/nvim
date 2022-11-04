-- Table containing the definitions of the default options
local M = {}

local utils = require("utils")

---Set a table containing all the options of the system
---@param options table #Table containing key-value neovim-options
local function set_options(options)
    for key, value in pairs(options) do
        vim.opt[key] = value
    end

    -- Some other settings
    vim.opt.shortmess:append("c")
    vim.opt.shortmess:append("I")
    vim.opt.whichwrap:append("<,>,[,],h,l")
end

-- Load default options without user interface
local function load_defaults_no_ui()
    vim.opt.shortmess = ""     -- try to prevent echom from cutting messages off or prompting
    vim.opt.more      = false  -- don't pause listing when screen is filled
    vim.opt.cmdheight = 9999   -- helps avoiding |hit-enter| prompts.
    vim.opt.columns   = 9999   -- set the widest screen possible
    vim.opt.swapfile  = false  -- don't use a swap file
end

function M:init(options)
    -- If vim does not have a user-interface, load no_ui configuration
    if utils.in_headless() then
        load_defaults_no_ui()
    else
        set_options(options)
    end
end

return M

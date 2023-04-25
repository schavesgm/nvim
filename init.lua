-- Add the current path path to the runtimepath
local path = debug.getinfo(1, "S").source:sub(2)
local config_path = path:match("(.*[/\\])"):sub(1, -2)

-- Append a given path to runtime path
if not vim.tbl_contains(vim.opt.rtp:get(), config_path) then
    vim.opt.rtp:append(config_path)
end

require("bootstrap"):init(config_path)

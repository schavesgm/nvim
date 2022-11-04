-- Add the current path path to the runtimepath
local path     = debug.getinfo(1, "S").source:sub(2)
local base_dir = path:match("(.*[/\\])"):sub(1, -2)

-- Append a given path to runtime path
if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
    vim.opt.rtp:append(base_dir)
end

require("bootstrap"):init()

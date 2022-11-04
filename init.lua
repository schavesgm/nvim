-- Add the current path path to the runtimepath
local path     = debug.getinfo(1, "S").source:sub(2)
local base_dir = path:match("(.*[/\\])"):sub(1, -2)

-- Append a given path to runtime path
if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
    vim.opt.rtp:append(base_dir)
end

vim.o.smartindent = true                        -- Make indenting smarter again
vim.o.autoindent  = true                        -- Allow Neovim to infer the indentation level of the line
vim.o.expandtab   = true                        -- Convert tabs to spaces
vim.o.tabstop     = 4                           -- Insert 2 spaces for a tab
vim.o.shiftwidth  = 4                           -- The number of spaces inserted for each indentation
vim.o.softtabstop = 4

require("bootstrap"):init()

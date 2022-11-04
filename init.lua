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

-- -- Install packer.nvim if it's not installed.
-- local packer_bootstrap
-- if not utils.is_plugin_installed("packer.nvim") then
--     packer_bootstrap = vim.fn.system({
--         "git",
--         "clone",
--         "--depth",
--         "1",
--         "https://github.com/wbthomason/packer.nvim",
--         utils.plugins_path .. "/start/packer.nvim",
--     })
--     vim.cmd([[packadd packer.nvim]])
-- end
-- 
-- local use = require("packer").use
-- 
-- return require("packer").startup({
--     function()
--         use({ "wbthomason/packer.nvim" })
-- 
--         -- These two plugins make CodeArt startup faster.
--         -- In addition FixCursorHold can fix this bug:
--         -- https://github.com/neovim/neovim/issues/12587
--         use({
--             "lewis6991/impatient.nvim",
--             config = function() require("impatient") end,
--         })
--         use({
--             "antoinemadec/FixCursorHold.nvim",
--             event = { "BufRead", "BufNewFile" },
--         })
-- 
--         if packer_bootstrap then
--             require("packer").sync()
--         end
--     end,
--     config = {
--         -- Default compile path of packer_compiled file.
--         compile_path = vim.fn.stdpath("config") .. "/plugin/" .. "packer_compiled.lua",
--         git = {clone_timeout = 300,},
--         -- Adding single border to packer window.
--         display = {
--             open_fn = function()
--                 return require("packer.util").float({ border = "single" })
--             end,
--         },
--     },
-- })

local M = {}

local utils = require("utils")

-- Initialise the plugin module
function M:init(plugins)

    -- Install packer.nvim if it's not installed.
    local PACKER_BOOTSTRAP
    if not utils.is_plugin_installed("packer.nvim") then
        PACKER_BOOTSTRAP = vim.fn.system({
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            utils.plugins_path .. "/start/packer.nvim",
        })
        vim.cmd([[packadd packer.nvim]])
        vim.notify("Installed packer inside " .. utils.plugins_path, vim.log.levels.INFO)
    end

    require("packer").startup({
        function()
            for _, plugin in ipairs(plugins) do
                use(plugin)
            end

            if PACKER_BOOTSTRAP then
                require("packer").sync()
            end
        end,
        config = {
            -- Default compile path of packer_compiled file.
            compile_path = vim.fn.stdpath("config") .. "/plugin/" .. "packer_compiled.lua",
            git = {clone_timeout = 300,},
            -- Adding single border to packer window.
            display = {
                open_fn = function()
                    return require("packer.util").float({ border = "single" })
                end,
            },
        },
    })
end

return M

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

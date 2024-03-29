-- Module used to bootstrap the configuration of gruvim
local M = {}

local MINIMUM_NVIM_VERSION = "0.8"

-- Bootstrap lazy-nvim plugin manager
local function bootstrap_lazy()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
        vim.notify("Bootstrapping lazy.nvim plugin manager")
	    vim.fn.system({
	        "git",
	        "clone",
	        "--filter=blob:none",
	        "--single-branch",
	        "https://github.com/folke/lazy.nvim.git",
	        lazypath,
	    })
	end
	vim.opt.runtimepath:prepend(lazypath)
end

---Initialise the configuration.
---@param config_path string; path to configuration to be saved as global
function M:init(config_path)

    -- Check the minimum version of NeoVim
    require("utils").assert_miminum_nvim_version(MINIMUM_NVIM_VERSION)

    -- Set the configuration path as a global
    _G.config_path = config_path

    -- Bootstrap lazy-nvim plugin manager
    bootstrap_lazy()

    -- Initialise the options module
    require("core.options"):init(require("defaults.options"))

    -- Initialise the keymaps module
    require("core.keymaps"):init(require("defaults.keymaps"))

    -- Initialise the autocommands module
    require("core.autocmds"):init(require("defaults.autocmds"))

    -- Initialise the commands module
    require("core.commands"):init(require("defaults.commands"))

    -- Initialise the plugins
    require("lazy").setup("plugins")

end

---Reload the neovim configuration
function M:reload()
    M:init(_G.config_path)
end

return M

-- Module used to bootstrap the configuration of gruvim
local M = {}

--- Vim has to be 0.8 at least
--- TODO: this should be a function.
if vim.fn.has "nvim-0.8" ~= 1 then
    vim.notify("Please upgrade your Neovim base installation. Requires v0.7+", vim.log.levels.WARN)
    vim.wait(5000, function() return false end)
    vim.cmd "cquit"
end

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
function M:init()

    -- Bootstrap lazy-nvim plugin manager
    bootstrap_lazy()

    -- Initialise the options module
    require("core.options"):init(require("defaults.options"))

    -- Initialise the keymaps module
    require("core.keymaps"):init(require("defaults.keymaps"))

    -- Initialise the autocommands module
    require("core.autocmds"):init(require("defaults.autocmds"))

    -- Initialise the plugins
    require("lazy").setup("plugins")

end

---Reload the neovim configuration
function M:reload()
    M:init()
end

return M

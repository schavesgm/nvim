local M = {
	"stevearc/dressing.nvim",
}

function M.config()
    local is_present, plugin = pcall(require, "dressing")
    if not is_present then return end

    plugin.setup()
end

return M

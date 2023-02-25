local M = {
	"phaazon/mind.nvim",
	branch = "v2.2",
	dependencies = { "nvim-lua/plenary.nvim" },
	command = {
		"MindClose",
		"MindOpenMain",
		"MindOpenProject",
		"MindOpenSmartProject",
		"MindReloadState",
	},
}

function M.config()
	local is_present, plugin = pcall(require, "mind")
	if not is_present then
		return
	end

	plugin.setup()
end

return M

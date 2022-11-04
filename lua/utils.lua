local M = {}

M.plugins_path = vim.fn.stdpath("data") .. "/site/pack/packer"

local function is_empty(path)
    return vim.fn.empty(vim.fn.glob(path)) > 0
end

---Check if a plugin is installed given its name.
---@param plugin_name string #Name of the plugin to check.
---@returns boolean #True if the plugin is installed, otherwise False.
function M.is_plugin_installed(plugin_name)
    local start_path = M.plugins_path .. "/start/" .. plugin_name
    local opt_path   = M.plugins_path .. "/start/" .. plugin_name
	if is_empty(start_path) and is_empty(opt_path) then
        return false
    end
    return true
end

return M

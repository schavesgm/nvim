local M = {
    "nvim-tree/nvim-web-devicons",
}

function M.config()
    local is_present, plugin = pcall(require, "nvim-web-devicons")
    if not is_present then return end
    plugin.setup()
end

return M

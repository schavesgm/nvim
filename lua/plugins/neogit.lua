local M = {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    dependencies = "nvim-lua/plenary.nvim",
}

function M.config()
    local is_present, plugin = pcall(require, "neogit")
    if not is_present then return end
    plugin.setup{}
end

return M

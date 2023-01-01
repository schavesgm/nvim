local M = {}

---Check if neovim is running on headless mode.
---@returns boolean #True if neovim runs on headless mode, otherwise False
function M.in_headless()
    return #vim.api.nvim_list_uis() == 0
end

return M

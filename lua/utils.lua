local M = {}

---Check if neovim is running on headless mode.
---@returns boolean #True if neovim runs on headless mode, otherwise False
function M.in_headless()
    return #vim.api.nvim_list_uis() == 0
end

--- Vim has to be 0.8 at least
---@param version string; NeoVim version to check.
function M.assert_miminum_nvim_version(version)
    local nvim_version = string.format("nvim-%s", version)
    if vim.fn.has(nvim_version) ~= 1 then
        vim.notify("Please upgrade your Neovim base installation. Requires v0.8+", vim.log.levels.WARN)
        vim.wait(5000, function() return false end)
        vim.cmd "cquit"
    end
end

return M

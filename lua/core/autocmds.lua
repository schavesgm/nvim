local M = {}

---Define a set of autogroups with their respective autocommands
---@param autocommands table #Table containing the augroups and their autocommands.
function M.set_augroup_autocmds(autocommands)
    for augroup, autocmds in pairs(autocommands) do
        local group = vim.api.nvim_create_augroup(augroup, { clear = true })
        for _, autocmd in ipairs(autocmds) do
            vim.api.nvim_create_autocmd(autocmd.event, vim.tbl_extend("keep",
                autocmd.opts,
                {
                    group = group
                }))
        end
    end
end

---Set the default autocommands on the system
---@param options table #Table containing all the autogroups and autocommands of the system
function M:init(options) M.set_augroup_autocmds(options) end

return M

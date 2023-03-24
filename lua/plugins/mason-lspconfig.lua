local M = {
    "williamboman/mason-lspconfig.nvim",
}

function M.config()
    local is_present, plugin = pcall(require, "mason-lspconfig")
    if not is_present then return end

    plugin.setup({
        ensure_installed = {"lua_ls", "pylsp"}
    })
end

return M

local M = {
    "L3MON4D3/LuaSnip",
    dependencies = {"nvim-cmp", "friendly-snippets"},
}

function M.config()
    local is_present, plugin = pcall(require, "luasnip")
    if not is_present then return end

    plugin.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
    })

    require("luasnip.loaders.from_vscode").lazy_load({paths = vim.g.luasnippets_path or ""})
    require("luasnip.loaders.from_vscode").lazy_load()

    vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function()
            if
                plugin.session.current_nodes[vim.api.nvim_get_current_buf()]
                and not require("luasnip").session.jump_active
            then
                plugin.unlink_current()
            end
        end,
    })
end

return M

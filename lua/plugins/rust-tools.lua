local M = {
    "simrat39/rust-tools.nvim"
}

function M.config()
    local is_present, plugin = pcall(require, "rust-tools")
    if not is_present then return end

    plugin.setup({
        server = {
            on_attach = function(_, bufnr)
                -- Hover actions
                vim.keymap.set(
                    "n", "<C-space>", plugin.hover_actions.hover_actions, { buffer = bufnr }
                )

                -- Code action groups
                vim.keymap.set(
                    "n", "<leader>a", plugin.code_action_group.code_action_group, { buffer = bufnr }
                )
            end
        }
    })
end

return M

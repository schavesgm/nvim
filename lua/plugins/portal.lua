local M = {
    "cbochs/portal.nvim",
    dependencies = {
        "cbochs/grapple.nvim",  -- Optional: provides the "grapple" query item
        "ThePrimeagen/harpoon", -- Optional: provides the "harpoon" query item
    },
}

function M.init()
    vim.keymap.set("n", "<leader>o", require("portal").jump_backward, {})
    vim.keymap.set("n", "<leader>i", require("portal").jump_forward, {})
end

function M.config()
    local is_present, plugin = pcall(require, "portal")
    if not is_present then return end
    plugin.setup{}
end

return M

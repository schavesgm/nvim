local M = {
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    dependencies = "kyazdani42/nvim-web-devicons",
}

function M.config()
    local is_present, plugin = pcall(require, "bufferline")
    if not is_present then return end

    plugin.setup{}
end

return M

if not vim.fn.executable("rgrep") then
    vim.notify("ripgrep is not installed, please run:", vim.log.levels.WARN)
    vim.notify("sudo apt install ripgrep", vim.log.levels.WARN)
end

local opts = {noremap=true, silent=true}
vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<cr>", opts)
vim.keymap.set('n', '<leader>fg', "<cmd>Telescope live_grep<cr>", opts)
vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<cr>", opts)
vim.keymap.set('n', '<leader>fq', "<cmd>Telescope quickfix<cr>", opts)

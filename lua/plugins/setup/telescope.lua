if not vim.fn.executable("rgrep") then
    vim.notify("ripgrep is not installed, please run:", vim.log.levels.WARN)
    vim.notify("sudo apt install ripgrep", vim.log.levels.WARN)
end


vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<cr>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fg', "<cmd>Telescope live_grep<cr>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<cr>", {noremap = true, silent = true})

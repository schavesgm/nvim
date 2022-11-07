local present, telescope = pcall(require, "telescope")
if not present then return end

-- Function to load telescope extensions
local function telescope_extension(extension)
    local present, _ = pcall(telescope.load_extension, extension)
    if not present then
        vim.notify('telescope extension ' .. extension .. ' cannot be loaded', vim.log.levels.WARN)
        return false
    end
    return true
end

-- Grab some modules
local actions = require("telescope.actions")

-- Load some telescope extensions using protected call
if telescope_extension("media_files") then
    local is_fdfind_installed = (vim.fn.executable('fdfind') == 1)
    if not is_fdfind_installed then
        vim.notify('fdfind [fd] cannot be found in system; run "sudo apt-get install fd-find":', vim.log.levels.WARN)
    else
        local is_fd_installed = (vim.fn.executable('fd') == 1)
        if not is_fd_installed then
            os.execute('ln -s $(which fdfind) ~/.local/bin/fd')
        end
    end
end

-- Check that ripgrep is installed in the system
local is_rg_installed = (vim.fn.executable('rg') == 1)
if not is_rg_installed then
    vim.notify 'rip-grep [rg] is not installed in $PATH; run "sudo apt-get install ripgrep"'
end

-- Setup telescope plugin
telescope.setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        mappings = {
            i = {
                ["<C-n>"]      = actions.cycle_history_next,
                ["<C-p>"]      = actions.cycle_history_prev,
                ["<C-j>"]      = actions.move_selection_next,
                ["<C-k>"]      = actions.move_selection_previous,
                ["<C-c>"]      = actions.close,
                ["<CR>"]       = actions.select_default,
                ["<C-x>"]      = actions.select_horizontal,
                ["<C-v>"]      = actions.select_vertical,
                ["<C-t>"]      = actions.select_tab,
                ["<C-u>"]      = actions.preview_scrolling_up,
                ["<C-d>"]      = actions.preview_scrolling_down,
                ["<PageUp>"]   = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,
                ["<Tab>"]      = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"]    = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"]      = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"]      = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"]      = actions.complete_tag,
                ["<C-_>"]      = actions.which_key, -- keys from pressing <C-/>
            },
            n = {
                ["<esc>"]      = actions.close,
                ["<CR>"]       = actions.select_default,
                ["<C-x>"]      = actions.select_horizontal,
                ["<C-v>"]      = actions.select_vertical,
                ["<C-t>"]      = actions.select_tab,
                ["<Tab>"]      = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"]    = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"]      = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"]      = actions.send_selected_to_qflist + actions.open_qflist,
                ["j"]          = actions.move_selection_next,
                ["k"]          = actions.move_selection_previous,
                ["H"]          = actions.move_to_top,
                ["M"]          = actions.move_to_middle,
                ["L"]          = actions.move_to_bottom,
                ["<Down>"]     = actions.move_selection_next,
                ["<Up>"]       = actions.move_selection_previous,
                ["gg"]         = actions.move_to_top,
                ["G"]          = actions.move_to_bottom,
                ["<C-u>"]      = actions.preview_scrolling_up,
                ["<C-d>"]      = actions.preview_scrolling_down,
                ["<PageUp>"]   = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,
                ["?"]          = actions.which_key,
            },
        }
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = {"node_modules"},
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = {"truncate"},
    winblend = 0,
    border = {},
    borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    color_devicons = true,
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg", "pdf"},
            find_cmd = "fdfind",
        },
        file_browser = {
            theme = "ivy",
        },
    },
}

-- Add some telescope keybindings
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<cr>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<cr>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fb', ":Telescope buffers<cr>", {noremap = true, silent = true})

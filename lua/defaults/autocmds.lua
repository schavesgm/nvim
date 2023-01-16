-- Local variable containing all the timed_autocommands
local timers = {}

-- Wrapper around a callback function to generate a timed loop
local function start_timed_callback(callback, start, every)
    return function()
        local bufnr   = vim.api.nvim_buf_get_name(0)
        local lambda  = vim.schedule_wrap(function() callback(bufnr) end)
        timers[bufnr] = vim.loop.new_timer()
        timers[bufnr]:start(start, every, lambda)
    end
end

-- Function that closes an already opened timed function
local function end_timed_callback()
    -- Get the current buffer name
    local bufnr = vim.api.nvim_buf_get_name(0)

    -- If the timer does exist, then close it
    if (timers[bufnr] ~= nil) then
        timers[bufnr]:close()
        timers[bufnr] = nil
    end
end

-- Small function to convert minutes to miliseconds
local function minutes_to_milisecodns(minutes)
    return minutes * 60 * 1000
end

-- Table containing all autogroups/autocommands definitions
return {
    RestoreCursor = {
        { event = "BufRead", opts = { pattern = "*", command = [[call setpos(".", getpos("'\""))]] } }
    },
    TerminalJob = {
        { event = "TermOpen", opts = { pattern = "*", command = [[tnoremap <buffer> <Esc> <c-\><c-n>]] } },
        { event = "TermOpen", opts = { pattern = "*", command = "startinsert" } },
        { event = "TermOpen", opts = { pattern = "*", command = [[setlocal nonumber norelativenumber]] } },
        { event = "TermOpen", opts = { pattern = "*", command = [[setlocal filetype=term]] } },
    },
    SaveToShada = {
        { event = "VimLeave", opts = { pattern = "*", command = "wshada!" } },
    },
    MarkupAutocmds = {
        {
            event = { "BufEnter", "WinEnter" },
            opts = { pattern = { "*.tex", "*.txt", "*.md" } },
            command = [[setlocal textwidth=100 colorcolumn=+1]]
        },
        {
            event = "BufEnter",
            opts = { pattern = { "*.tex", "*.md" } },
            callback = start_timed_callback(
                function(bufnr) vim.cmd(':w ' .. bufnr) end,
                minutes_to_milisecodns(3),
                minutes_to_milisecodns(3)
            )
        },
        {
            event = "BufLeave",
            opts = { pattern = { "*.tex", "*.md" } },
            callback = end_timed_callback,
        }
    },
}

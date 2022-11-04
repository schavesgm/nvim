-- Local variable containing all the timed_autocommands
local timers = {}

-- Wrapper around a callback function to generate a timed loop
local function start_timed_callback(callback, start, every)
    return function()
        local bufnr  = vim.api.nvim_buf_get_name(0)
        local lambda = vim.schedule_wrap(function() callback(bufnr) end)
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

-- Small function used to save a buffer by its buffer name
local function save_buffer(bufnr)
    vim.cmd(':w ' .. bufnr)
end

-- Small function to convert minutes to miliseconds
local function to_milisecodns(minutes)
    return minutes * 60 * 1000
end

-- Table containing all autogroups/autocommands definitions
return {
    RestoreCursor = {
        {event="BufRead", opts={pattern="*", command=[[call setpos(".", getpos("'\""))]]}}
    },
    TerminalJob = {
        {event="TermOpen", opts={pattern="*", command=[[tnoremap <buffer> <Esc> <c-\><c-n>]]}},
        {event="TermOpen", opts={pattern="*", command="startinsert"}},
        {event="TermOpen", opts={pattern="*", command=[[setlocal nonumber norelativenumber]]}},
        {event="TermOpen", opts={pattern="*", command=[[setlocal filetype=term]]}},
    },
    SaveToShada = {
        {event="VimLeave", opts={pattern="*", command="wshada!"}},
    },
    MarkupAutocmds = {
        {event="FileType", opts={pattern={"tex", "text", "markdown"}, command=[[setlocal colorcolumn=+1]]}},
        {event="FileType", opts={pattern={"tex", "text", "markdown"}, command=[[setlocal spell]]}},
        {event="BufEnter", opts={pattern={"*.tex", "*.md"}, callback=start_timed_callback(save_buffer, to_milisecodns(3), to_milisecodns(3))}},
        {event="BufLeave", opts={pattern={"*.tex", "*.md"}, callback=end_timed_callback}}
    },
}

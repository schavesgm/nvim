local M = {}

-- Dictionary containing the basic options for each mode
local base_options = {
    insert       = {noremap=true, silent=true},
    normal       = {noremap=true, silent=true},
    visual       = {noremap=true, silent=true},
    command      = {noremap=true, silent=true},
    visual_block = {noremap=true, silent=true},
    terminal     = {noremap=true, silent=true},
}

-- Dictionary containing the mode names
local mode_names = {
    insert       = 'i',
    normal       = 'n',
    visual       = 'v',
    command      = 'c',
    visual_block = 'x',
    terminal     = 't'
}

---Unset all the keymaps contained in table
---@param (table) table containing all keymaps
function M.unset_keymaps(keymaps)
    for mode, keystrokes in pairs(keymaps) do
        mode = mode_names[mode] or mode
        for _, key in ipairs(keystrokes) do
            vim.keymap.del(mode, key)
        end
    end
end

---Set all the keymaps contained in table
---@param keymaps table #Table containing all keymaps
function M.set_keymaps(keymaps)
    for mode, mappings in pairs(keymaps) do
        local mode_name = mode_names[mode]
        if (mode_name == nil) then
            vim.notify(mode .. ' is not an available mode. Ignoring')
            goto continue
        end

        -- Set the mapping, the key contains the command and then the result
        for lhs, rhs in pairs(mappings) do
            -- If the rhs is nil, then delete the mapping
            if not rhs then
                vim.keymap.del(mode_name, lhs)
            end

            local mapping = rhs
            local options = base_options[mode]

            -- If the mapping is a table, then process it
            if type(rhs) == "table" then
                mapping = rhs.rhs  or rhs[1]
                options = rhs.opts or rhs[2]
            end
            vim.keymap.set(mode_name, lhs, mapping, options)
        end
        ::continue::
    end
end

---Set some keybindings in the system
---@param options table #Table containign the keybindings of the system
function M:init(options)
    M.set_keymaps(options)
end

return M

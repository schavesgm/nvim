-- Table containing some server configurations
local M = {}

-- Add all the servers
local servers = {"jsonls", "sumneko_lua", "pyright", "texlab"}

for _, name in ipairs(servers) do
    M[name] = require(string.format("lsp.servers.%s", name))
end

return M
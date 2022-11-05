local present_1, lspconfig = pcall(require, "lspconfig")
if not present_1 then return end
local present_2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not present_2 then return end
local present_3, cmp = pcall(require, "cmp_nvim_lsp")

-- Define the capabilities using cmp
local capabilities = nil
if present_3 then
    capabilites = cmp_lsp.default_capabilities()
end

-- Function to be called when attaching
local function on_attach(client, bufnr)
    -- On attach function to attach some highlighting and keymaps
    if client.name == "tsserver" then
        client.server_capabilities.document_formatting = false
    end

    -- Set some required functionalities on attach
    require("lsp.utils").lsp_highlight_document(client)
    require("lsp.utils").lsp_keymaps(bufnr)

    local present, lsp_signature = pcall(require, "lsp_signature")
    if present then
        lsp_signature.on_attach({
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {"rounded"},
        }, bufnr)
    end
end

-- Get all the server settings
local server_configs = require("lsp.servers")

-- Iterate through all pairs 
for _, server in ipairs(mason_lspconfig.get_installed_servers()) do

    -- Basic server configuration
    local config = {
        on_attach    = on_attach,
        capabilities = capabilities,
    }

    -- If a configuration is present, then add it
    if server_configs[server] ~= nil then
        config = vim.tbl_deep_extend("force", config, server_configs[server])
    end

    -- Call the setup method
    lspconfig[server].setup(config)
end

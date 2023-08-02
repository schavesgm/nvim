local present_1, lspconfig = pcall(require, "lspconfig")
if not present_1 then return end
local present_2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not present_2 then return end

-- Optional plugins
local is_signature_present, lsp_signature = pcall(require, "lsp_signature")
local is_vtypes_present, virtual_types = pcall(require, "virtualtypes")
local is_navic_present, navic = pcall(require, "nvim-navic")
local is_navbuddy_present, navbuddy = pcall(require, "nvim-navbuddy")

---Function to be called when attaching
local function on_attach(client, bufnr)
    -- On attach function to attach some highlighting and keymaps
    if client.name == "tsserver" then
        client.server_capabilities.document_formatting = false
    end

    -- Set some required functionalities on attach
    require("lsp.utils").lsp_highlight_document(client)
    require("lsp.utils").lsp_keymaps(bufnr)

    -- Attach lsp_signature
    if is_signature_present then
        lsp_signature.on_attach({
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = { "rounded" },
        }, bufnr)
    end

    -- Attach nvim_navic
    if is_navic_present then
        navic.attach(client, bufnr)
    end

    -- Attach nvim-navbuddy
    if is_navbuddy_present then
        navbuddy.attach(client, bufnr)
    end

    -- Attach virtual types
    if is_vtypes_present then
        virtual_types.on_attach()
    end
end

-- Get all the server settings
local server_configs = require("lsp.servers")

-- Iterate through all pairs
for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
    -- Basic server configuration
    local config = { on_attach = on_attach, }

    -- If a configuration is present, then add it
    if server_configs[server] ~= nil then
        config = vim.tbl_deep_extend("force", config, server_configs[server])
    end

    -- Call the setup method
    lspconfig[server].setup(config)
end

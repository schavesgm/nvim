-- Module containing the LSP-handlers
local M = {}

---TODO: Make this utils
---Generate a table that can communicate with vim.diagnostic.severity
---@param ERROR any Error item in the table
---@param WARN any Warn item in the table
---@param HINT any Hint item in the table
---@param INFO any Info item in the table
local function generate_severity_table(ERROR, WARN, HINT, INFO)
    return {
        ERROR, E = ERROR, ERROR = ERROR,
        WARN , W = WARN,  WARN  = WARN,
        HINT , H = HINT,  HINT  = HINT,
        INFO , I = INFO,  INFO  = INFO,
    }
end

---Transform a severity integer into a string
local function from_sevint_to_string(sevint)
    local mapping = {"Error", "Warn", "Hint", "Info"}
    return mapping[sevint]
end

-- Setup function
function M.setup()

    -- Define the emoji employed for each severity
    local severity_emojis = generate_severity_table("🦠", "🐍", "🐧", "🦊")

    local signs = {
        {name = "DiagnosticSignError", text = severity_emojis.ERROR},
        {name = "DiagnosticSignWarn",  text = severity_emojis.WARN},
        {name = "DiagnosticSignHint",  text = severity_emojis.HINT},
        {name = "DiagnosticSignInfo",  text = severity_emojis.INFO},
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, {texthl=sign.name, text=sign.text, numhl=""})
    end

    -- Default configuration for all handlers
    local config = {
        virtual_text = {
            format = function(diagnostic)
                local msg = string.format("%s", diagnostic.message)
                if diagnostic.code then
                    msg = string.format("%s: %s", diagnostic.code, msg)
                end
                return string.format("%s 🡒 %s",severity_emojis[diagnostic.severity], msg)
            end,
            prefix = "",
        },
        signs = {active = signs},
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style     = "minimal",
            border    = "rounded",
            source    = "if_many",
            header    = "",
            prefix    = "",
            format    = function(diagnostic)
                local severity = diagnostic.severity
                return string.format("%s %s 🡒  %s",
                    ({"Error", "Warn", "Hint", "Info"})[severity],
                    severity_emojis[severity],
                    diagnostic.message
                )
            end,
        },
    }

    -- Add the configuration of LSP
    vim.diagnostic.config(config)

    --- Add some handlers to the configuration
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/completion/completionItem"] = {
        documentationFormat = { "markdown", "plaintext" },
        snippetSupport = true,
        preselectSupport = true,
        insertReplaceSupport = true,
        labelDetailsSupport = true,
        deprecatedSupport = true,
        commitCharactersSupport = true,
        tagSupport = { valueSet = { 1 } },
        resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}
end

return M

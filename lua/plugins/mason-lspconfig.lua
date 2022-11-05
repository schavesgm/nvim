local present, plugin = pcall(require, "mason-lspconfig")
if not present then return end

plugin.setup({
    ensure_installed = {"sumneko_lua"}
})

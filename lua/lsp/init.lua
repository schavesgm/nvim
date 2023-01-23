local present, _ = pcall(require, "lspconfig")
if not present then return end

require("lsp.installer")
require("lsp.handlers").setup()

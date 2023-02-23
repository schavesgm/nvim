local M = {
	"jay-babu/mason-null-ls.nvim",
	dependencies = {
		"jose-elias-alvarez/null-ls.nvim",
		"williamboman/mason.nvim",
	},
}

function M.config()
	local is_mason_null_present, mason_null = pcall(require, "mason-null-ls")
	if not is_mason_null_present then
		return
	end
	local is_null_present, null_ls = pcall(require, "null-ls")
	if not is_null_present then
		return
	end

	mason_null.setup({ automatic_setup = true, sources = {} })

	mason_null.setup_handlers({
		stylua = function(_, _)
			null_ls.register(null_ls.builtins.formatting.stylua)
		end,
        prettier = function(_, _)
            null_ls.register(null_ls.builtins.formatting.prettier)
        end,
        yamllint = function(_, _)
            null_ls.register(null_ls.builtins.diagnostics.yamllint)
        end,
	})
end

return M

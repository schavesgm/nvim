local M = {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
}

function M.init()
	vim.keymap.set("n", "<leader>db", function()
		require("dap").toggle_breakpoint()
	end)
	vim.keymap.set("n", "<leader>dp", function()
		require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
	end)
	vim.keymap.set("n", "<leader>dr", function()
		require("dap").repl.open()
	end)
	vim.keymap.set("n", "<leader>dn", function()
		require("dap").continue()
	end)
	vim.keymap.set("n", "<leader>dl", function()
		require("dap").run_last()
	end)
	vim.keymap.set({ "n", "v" }, "<leader>dh", function()
		require("dap.ui.widgets").hover()
	end)
	vim.keymap.set({ "n", "v" }, "<leader>dp", function()
		require("dap.ui.widgets").preview()
	end)
	vim.keymap.set("n", "<leader>df", function()
		local widgets = require("dap.ui.widgets")
		widgets.centered_float(widgets.frames)
	end)
	vim.keymap.set("n", "<leader>ds", function()
		local widgets = require("dap.ui.widgets")
		widgets.centered_float(widgets.scopes)
	end)

	vim.keymap.set("n", "<F10>", function()
		require("dap").step_over()
	end)
	vim.keymap.set("n", "<F11>", function()
		require("dap").step_into()
	end)
	vim.keymap.set("n", "<F12>", function()
		require("dap").step_out()
	end)
end

function M.config()
	local is_present_mason_dap, mason_dap = pcall(require, "mason-nvim-dap")
	if not is_present_mason_dap then
		return
	end
	local is_present_dap, dap = pcall(require, "dap")
	if not is_present_dap then
		return
	end

	mason_dap.setup({
		automatic_setup = true,
	})

	mason_dap.setup_handlers({
		python = function(_)
			dap.adapters.python = {
				type = "executable",
				command = "python",
				args = {
					"-m",
					"debugpy.adapter",
				},
			}
			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}", -- This configuration will launch the current file if used.
				},
			}
		end,
	})
end

return M

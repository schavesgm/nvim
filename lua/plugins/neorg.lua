local M = {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	opts = {
		load = {
			["core.defaults"] = {}, -- Loads default behaviour
            ["core.fs"] = {},
            ["core.keybinds"] = {
                config = {
                    defaults_keybinds = true,
                }
            },
			["core.norg.concealer"] = {},
			["core.norg.completion"] = {
                config = {
                    engine = "nvim-cmp",
                }
            },
			["core.norg.dirman"] = {
				config = {
                    default_workspace = "tasks",
					workspaces = {
						tasks = "~/Documents/neorg/tasks",
						notes = "~/Documents/neorg/notes",
					},
                    index = "index.norg",
                    use_popup = true,
				},
			},
            ["core.norg.esupports.hop"] = {},
		},
	},
	dependencies = { { "nvim-lua/plenary.nvim" } },
}

return M

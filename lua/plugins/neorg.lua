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
			["core.concealer"] = {},
			["core.completion"] = {
                config = {
                    engine = "nvim-cmp",
                }
            },
			["core.dirman"] = {
				config = {
                    default_workspace = "tasks",
					workspaces = {
						tasks = "~/Documents/neorg/tasks",
					},
                    index = "index.norg",
                    use_popup = true,
				},
			},
            ["core.esupports.hop"] = {},
            ["core.journal"] = {},
		},
	},
	dependencies = { 
        {"nvim-lua/plenary.nvim"},
    },
}

return M

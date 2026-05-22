return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
		{ "<leader>nf", "<cmd>Neotree reveal<cr>", desc = "Reveal file in Explorer" },
	},
	opts = {
		close_if_last_window = true,
		window = {
			position = "left",
			width = 30,
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = true,
				hide_by_name = { ".git" },
			},
			follow_current_file = { enabled = true },
		},
		default_component_configs = {
			indent = {
				indent_size = 2,
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
				with_expanders = true,
				expander_collapsed = "▶",
				expander_expanded = "▼",
			},
			-- Colour filenames by git state (VS Code explorer behaviour)
			name = {
				use_git_status_colors = true,
			},
			-- Single-letter indicators matching VS Code's Source Control view
			git_status = {
				symbols = {
					added = "A",
					modified = "M",
					deleted = "D",
					renamed = "R",
					untracked = "U",
					ignored = "",
					unstaged = "",
					staged = "",
					conflict = "C",
				},
			},
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)

		-- VS Code-matching git highlight colours
		local hl = vim.api.nvim_set_hl
		hl(0, "NeoTreeGitAdded", { fg = "#81b88b" })
		hl(0, "NeoTreeGitModified", { fg = "#e2c08d" })
		hl(0, "NeoTreeGitDeleted", { fg = "#c74e39" })
		hl(0, "NeoTreeGitRenamed", { fg = "#73c991" })
		hl(0, "NeoTreeGitUntracked", { fg = "#73c991" })
		hl(0, "NeoTreeGitConflict", { fg = "#e4676b" })
		hl(0, "NeoTreeGitIgnored", { fg = "#525252", italic = true })
		hl(0, "NeoTreeGitUnstaged", { fg = "#e2c08d" })

		-- Re-apply after colorscheme changes
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				hl(0, "NeoTreeGitAdded", { fg = "#81b88b" })
				hl(0, "NeoTreeGitModified", { fg = "#e2c08d" })
				hl(0, "NeoTreeGitDeleted", { fg = "#c74e39" })
				hl(0, "NeoTreeGitRenamed", { fg = "#73c991" })
				hl(0, "NeoTreeGitUntracked", { fg = "#73c991" })
				hl(0, "NeoTreeGitConflict", { fg = "#e4676b" })
				hl(0, "NeoTreeGitIgnored", { fg = "#525252", italic = true })
				hl(0, "NeoTreeGitUnstaged", { fg = "#e2c08d" })
			end,
		})
	end,
	init = function()
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				vim.schedule(function()
					vim.cmd("Neotree show")
					vim.cmd("wincmd p")
				end)
			end,
		})
	end,
}

return {
	{ "tpope/vim-fugitive" },

	{
		"kdheepak/lazygit.nvim",
		cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
		config = function()
			vim.g.lazygit_floating_window_winblend = 0
			vim.g.lazygit_floating_window_scaling_factor = 0.9
			vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
			vim.g.lazygit_use_neovim_remote = 1
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPost",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "▎" },
					change = { text = "▎" },
					delete = { text = "" },
					topdelete = { text = "" },
					changedelete = { text = "▎" },
					untracked = { text = "▎" },
				},
				signs_staged = {
					add = { text = "▎" },
					change = { text = "▎" },
					delete = { text = "" },
					topdelete = { text = "" },
					changedelete = { text = "▎" },
					untracked = { text = "▎" },
				},
				signs_staged_enable = true,
				signcolumn = true,
				numhl = true,
				current_line_blame = false,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol",
					delay = 300,
				},
				current_line_blame_formatter = "  <author>, <author_time:%R> - <summary>",
				on_attach = function(bufnr)
					local gs = require("gitsigns")
					local map = function(mode, l, r, desc)
						vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
					end

					-- Navigation between hunks
					map("n", "]h", gs.next_hunk, "Next hunk")
					map("n", "[h", gs.prev_hunk, "Prev hunk")

					-- Actions
					map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
					map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
					map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
					map("n", "<leader>gu", gs.undo_stage_hunk, "Undo stage hunk")
					map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
					map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")
					map("n", "<leader>gb", gs.toggle_current_line_blame, "Toggle line blame")
					map("n", "<leader>gd", gs.diffthis, "Diff against index")
				end,
			})

			-- Sign column colors
			vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#98c379" })
			vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#e5c07b" })
			vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#e06c75" })
			vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = "#e5c07b" })
			vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = "#56b6c2" })

			-- Line number colors
			vim.api.nvim_set_hl(0, "GitSignsAddNr", { fg = "#98c379" })
			vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = "#e5c07b" })
			vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = "#e06c75" })
		end,
	},
}

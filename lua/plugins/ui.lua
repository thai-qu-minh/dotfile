return {
	-- LSP progress indicator (bottom-right spinner while LSP loads)
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {
			notification = {
				window = { winblend = 0 },
			},
		},
	},

	-- Indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "BufReadPost",
		opts = {
			indent = { char = "│" },
			scope = { enabled = true },
		},
	},

	-- Better notifications
	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require("notify")
			notify.setup({
				timeout = 3000,
				render = "minimal",
				stages = "fade",
				max_width = function()
					return math.floor(vim.o.columns * 0.75)
				end,
			})
			vim.notify = notify
		end,
	},

	-- Floating cmdline, messages, and popupmenu
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				lsp_doc_border = true,
			},
		},
	},
}

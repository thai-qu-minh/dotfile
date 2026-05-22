return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "BufReadPost",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				numbers = "none",
				close_command = "bdelete! %d",
				indicator = {
					style = "icon",
					icon = "▎",
				},
				modified_icon = "●",
				left_trunc_marker = "",
				right_trunc_marker = "",
				show_buffer_close_icons = true,
				show_close_icon = false,
				separator_style = "slant",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return icon .. count
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true,
					},
				},
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
		vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
		vim.keymap.set("n", "<leader>bc", "<cmd>bdelete<cr>", { desc = "Close buffer" })
		vim.keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<cr>", { desc = "Pick buffer" })
	end,
}

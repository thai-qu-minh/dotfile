return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		delay = 500,
		icons = { mappings = true },
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.add({
			{ "<leader>b", group = "Buffers" },
			{ "<leader>c", group = "Code" },
			{ "<leader>d", group = "Diagnostics" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>n", group = "Explorer" },
			{ "<leader>t", group = "Terminal" },
		})
	end,
}

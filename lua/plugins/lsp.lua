return {
	{ "neovim/nvim-lspconfig" },

	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		opts = {},
	},

	-- Auto-install formatters/linters that conform.nvim expects
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = { "prettier", "stylua" },
			auto_update = false,
			run_on_start = true,
		},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				ensure_installed = { "ruff", "pyright", "ts_ls", "lua_ls" },
				automatic_installation = true,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(args)
					local bufnr = args.buf
					local opts = { buffer = bufnr, silent = true }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set(
						"n",
						"<leader>cr",
						vim.lsp.buf.rename,
						vim.tbl_extend("force", opts, { desc = "Rename symbol" })
					)
					vim.keymap.set(
						{ "n", "v" },
						"<leader>ca",
						vim.lsp.buf.code_action,
						vim.tbl_extend("force", opts, { desc = "Code action" })
					)
				end,
			})

			-- Python
			vim.lsp.config("pyright", {
				capabilities = capabilities,
				root_markers = { ".git", "pyproject.toml", "setup.cfg", "setup.py" },
			})
			vim.lsp.config("ruff", {
				capabilities = capabilities,
				root_markers = { ".git", "pyproject.toml" },
			})

			-- TypeScript / JavaScript
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				root_markers = { "package.json", "tsconfig.json", ".git" },
			})

			-- Lua (useful for editing this config)
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = { enable = false },
					},
				},
			})

			vim.lsp.enable("pyright")
			vim.lsp.enable("ruff")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("lua_ls")
		end,
	},
}

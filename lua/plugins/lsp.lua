
-- install lsp 
--

return {
  -- nim-lspconfig
  {
    "neovim/nvim-lspconfig",
  },
  -- Mason: manages external tools (LSPs, linters, formatters)
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  -- Mason-LSPconfig: bridges mason and nvim-lspconfig
  {
    "mason-org/mason-lspconfig.nvim",
    depedencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local mason_lspconfig = require("mason-lspconfig")

      -- install pyright
      mason_lspconfig.setup {
        ensure_installed = { "ruff", "pyright" },
        automatically_installation = true,
      }

      local augroup = vim.api.nvim_create_augroup("UserLspConfig", {})

      vim.api.nvim_create_autocmd("LspAttach", {
        group = augroup,
        callback = function(args)
          local bufnr = args.buf
          local opts = { buffer = bufnr, silent = true }

          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        end
      })

      -- Configure python lsp server with new api
      -- (venv-lsp will hook into pyright here)
      vim.lsp.config("pyright", {
        -- optional root markers etc.
        capabilities = capabilities,
        root_markers = { ".git", "pyproject.toml", "setup.cfg", "setup.py"}
      })

      vim.lsp.config("ruff", {
        capabilities = capabilities,
        root_markers = { ".git", "pyproject.toml" }
      })


      -- Enable the server
      vim.lsp.enable("pyright")
      vim.lsp.enable("ruff")

    end
  }
}

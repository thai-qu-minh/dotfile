

return {
  "jglasovic/venv-lsp.nvim",
  ft =  "python",
  config = function()
    require("venv-lsp").setup()
  end
}

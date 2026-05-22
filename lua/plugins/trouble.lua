
return {
  "folke/trouble.nvim",
  opts = {}, -- use default settings
  cmd = "Trouble",
  keys = {
    {
      "<leader>dd",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Toggle diagnostics (workspace)",
    },
    {
      "<leader>df",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Toggle diagnostics (current file)",
    },
  }
}


return {
  "folke/trouble.nvim",
  opts = {}, -- use default settings
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Toggle diagnostic (workspace)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Toggle diagnostic (current buffer)",
    }
  }
}

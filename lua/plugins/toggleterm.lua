
return {
  'akinsho/toggleterm.nvim',
  config = function()
    require("toggleterm").setup({
      -- Your desired configuration options here
      -- Example:
      size = 10,
      open_mapping = [[<c-\>]], -- Example: Use Ctrl+\ to toggle
      direction = "float", -- or "horizontal", "vertical"
      shade_terminals = true,
      shading_factor = 1,
      start_in_insert = true,
      persist_size = true,
      -- Add more options as needed
    })
  end,
  keys = {
    -- Example custom keybindings
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Floating Terminal" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Horizontal Terminal" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle Vertical Terminal" },
  },
}

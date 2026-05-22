return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- optional: faster fuzzy sorter
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({})
      pcall(telescope.load_extension, "fzf")

      local builtin = require("telescope.builtin")

      -- Jump to a non-NERDTree window before opening Telescope
      local function from_main_window(fn)
        return function()
          if vim.bo.filetype == "nerdtree" then
            vim.cmd("wincmd p")
          end
          fn()
        end
      end

      vim.keymap.set("n", "<leader>ff", from_main_window(builtin.find_files), { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", from_main_window(builtin.live_grep),  { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", from_main_window(builtin.buffers),    { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fh", from_main_window(builtin.help_tags),  { desc = "Help" })
    end,
  },
}

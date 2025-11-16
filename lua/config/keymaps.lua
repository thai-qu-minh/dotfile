local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Quality of life
map("n", "<leader>w", "<cmd>w<cr>", opts)
map("n", "<leader>q", "<cmd>q<cr>", opts)
map("n", "<leader>h", "<cmd>nohlsearch<cr>", opts)
map("n", "<leader>e", "<cmd>Ex<cr>", opts) -- netrw quick open

-- Movement between splits
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

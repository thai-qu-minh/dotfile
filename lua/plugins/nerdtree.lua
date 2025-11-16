
return {
  "preservim/nerdtree",
  config = function()
    vim.g.NERDTreeShowHidden = 1
    vim.g.NERDTreeIgnore = {"%.git"}
    vim.keymap.set("n","<leader>nt", ":NERDTreeToggle<CR>", {})
  end,
}

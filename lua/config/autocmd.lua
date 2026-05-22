local group = vim.api.nvim_create_augroup("AutoReloadFromDisk", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	group = group,
	callback = function()
		vim.cmd("checktime")
	end,
})

-- Auto show diagnostics float when cursor holds on a line with errors
vim.api.nvim_create_autocmd("CursorHold", {
	group = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true }),
	callback = function()
		vim.diagnostic.open_float(nil, { focusable = false })
	end,
})

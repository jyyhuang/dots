require("yazi").setup({
	floating_window_scaling_factor = 1,
	yazi_floating_window_border = "none",
})

vim.keymap.set("n", "-", "<cmd>Yazi<cr>", { desc = "Open yazi at the current file" })

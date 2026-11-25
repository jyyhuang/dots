local Snacks = require("snacks")

Snacks.setup({
	picker = {
		enabled = true,
		sources = {
			files = { hidden = true },
			grep = { hidden = true },
		},
		layout = {
			fullscreen = true,
		},
	},
	notifier = { enabled = true },
	words = { enabled = true },
})

vim.keymap.set("n", "<leader>ff", Snacks.picker.files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", Snacks.picker.grep, { desc = "Find grep" })
vim.keymap.set("n", "<leader>fk", Snacks.picker.keymaps, { desc = "Find keymaps" })
vim.keymap.set("n", "<leader>fh", Snacks.picker.help, { desc = "Find help tags" })
vim.keymap.set("n", "<leader>fd", Snacks.picker.diagnostics, { desc = "Find diagnostics" })
vim.keymap.set("n", "<leader>fn", Snacks.picker.notifications, { desc = "Find notifications" })
vim.keymap.set("n", "<leader>fl", Snacks.picker.lsp_config, { desc = "Find LSP info" })
vim.keymap.set("n", "<leader>fr", Snacks.picker.resume, { desc = "Resume last picker" })
vim.keymap.set("n", "<leader>fgd", Snacks.picker.git_diff, { desc = "Git diff" })

vim.keymap.set("n", "]]", function()
	Snacks.words.jump(vim.v.count1)
end, { desc = "Next reference" })

vim.keymap.set("n", "[[", function()
	Snacks.words.jump(-vim.v.count1)
end, { desc = "Prev reference" })

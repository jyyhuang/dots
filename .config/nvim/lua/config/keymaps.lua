vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down one line" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up one line" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join next line onto current line (keep cursor)" })

vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

-- Navigate
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate right" })

-- Resize windows
vim.keymap.set("n", "<C-Up>", "<cmd>resize +5<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -5<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -5<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +5<cr>", { desc = "Increase Window Width" })

-- Delete, Change, Paste preserve yank register
vim.keymap.set({ "n", "v" }, "<Leader>d", '"_d', { desc = "Delete without yank register" })
vim.keymap.set({ "n", "v" }, "<Leader>c", '"_c', { desc = "Change without yank register" })
vim.keymap.set({ "n", "v" }, "<Leader>p", '"0p', { desc = "Paste last yank" })

-- Delete backwards
vim.keymap.set("n", "dw", 'vb"_d', { desc = "Delete word backwards without yank register" })

-- Increment and Decrement numbers
vim.keymap.set("n", "+", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "_", "<C-x>", { desc = "Decrement number" })

-- Splits
vim.keymap.set("n", "ss", ":split<Return>", { desc = "Split window horizontally" })
vim.keymap.set("n", "sv", ":vsplit<Return>", { desc = "Split window vertically" })

-- Replace (not silent, so the command line is visible while editing)
vim.keymap.set("n", "<Leader>r", [[:%s/<C-r><C-w>//g<Left><Left>]], { desc = "Change Word", silent = false })

vim.keymap.set(
	{ "n", "v" },
	"<Leader>ar",
	[[:,$s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word under cursor from current line to end", silent = false }
)

vim.keymap.set("n", "<Leader>ut", function()
	require("undotree").open()
end, { desc = "Toggle builtin undotree" })

vim.keymap.set("n", "<leader>pu", vim.pack.update, { desc = "Pack: update all" })

vim.keymap.set("n", "<leader>pd", function()
	local stale = vim.iter(vim.pack.get())
		:filter(function(p)
			return not p.active
		end)
		:map(function(p)
			return p.spec.name
		end)
		:totable()
	if #stale == 0 then
		vim.notify("Nothing to clean")
		return
	end
	vim.ui.select({ "Yes", "No" }, {
		prompt = "Delete " .. #stale .. " unused plugin(s): " .. table.concat(stale, ", ") .. "?",
	}, function(choice)
		if choice == "Yes" then
			vim.pack.del(stale)
			vim.notify("Removed: " .. table.concat(stale, ", "))
		end
	end)
end, { desc = "Pack: clean unused" })

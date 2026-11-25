local augroup = vim.api.nvim_create_augroup("autocmds", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking",
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	desc = "Cursor line shows when entering window or buffer",
	group = augroup,
	callback = function()
		vim.wo.cursorline = true
	end,
})

vim.api.nvim_create_autocmd("WinLeave", {
	desc = "Cursor line hides when leaving window",
	group = augroup,
	callback = function()
		vim.wo.cursorline = false
	end,
})

local function transparent_floats()
	local groups = {
		"NormalFloat",
		"FloatBorder",
		"FloatTitle",
		"SnacksPicker",
		"SnacksPickerBorder",
		"SnacksPickerTitle",
		"SnacksPickerInput",
		"SnacksPickerInputBorder",
		"SnacksPickerInputTitle",
		"SnacksPickerList",
		"SnacksPickerListBorder",
		"SnacksPickerListTitle",
		"SnacksPickerPreview",
		"SnacksPickerPreviewBorder",
		"SnacksPickerPreviewTitle",
		"SnacksPickerBox",
		"SnacksPickerBoxBorder",
		"SnacksPickerBoxTitle",
		"BlinkCmpMenu",
		"BlinkCmpMenuBorder",
		"BlinkCmpDoc",
		"BlinkCmpDocBorder",
		"BlinkCmpDocSeparator",
		"BlinkCmpSignatureHelp",
		"BlinkCmpSignatureHelpBorder",
	}
	for _, g in ipairs(groups) do
		local hl = vim.api.nvim_get_hl(0, { name = g, link = false })
		hl.bg = nil
		hl.ctermbg = nil
		vim.api.nvim_set_hl(0, g, hl)
	end
end

vim.api.nvim_create_autocmd("ColorScheme", { callback = transparent_floats })

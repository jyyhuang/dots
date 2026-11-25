local function macro_recording()
	return {
		function()
			local reg = vim.fn.reg_recording()
			return reg ~= "" and ("recording @" .. reg) or ""
		end,
	}
end

require("lualine").setup({
	options = {
		theme = "auto",
		disabled_filetypes = { "alpha", "snacks_picker_input" },
		globalstatus = true,
		refresh = {
			events = {
				"WinEnter",
				"BufEnter",
				"BufWritePost",
				"SessionLoadPost",
				"FileChangedShellPost",
				"VimResized",
				"Filetype",
				"CursorMoved",
				"CursorMovedI",
				"ModeChanged",
				"RecordingEnter",
				"RecordingLeave",
			},
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff" },
		lualine_c = {
			{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
			{ "filename", path = 1, padding = { left = 0, right = 1 } },
		},
		lualine_x = {
			macro_recording(),
			"diagnostics",
			"searchcount",
		},
		lualine_y = { "progress", "location" },
		lualine_z = {
			{
				"lsp_status",
				icons_enabled = false,
			},
		},
	},
})

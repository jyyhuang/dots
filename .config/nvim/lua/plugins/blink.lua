local cmp = require("blink.cmp")
cmp.build():pwait()

cmp.setup({
	keymap = {
		preset = "enter",
		["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
	},
	completion = {
		keyword = { range = "full" },
		accept = { auto_brackets = { enabled = true } },
		list = { selection = { preselect = false, auto_insert = false } },
		menu = {
			border = "rounded",
			draw = {
				padding = 1,
				columns = {
					{ "label", "label_description" },
					{ "kind_icon", gap = 1, "kind" },
				},
				treesitter = { "lsp" },
			},
		},
		documentation = { auto_show = true, auto_show_delay_ms = 0, window = { border = "rounded" } },
		ghost_text = { enabled = true },
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	signature = { enabled = true, window = { border = "rounded" } },
	fuzzy = { implementation = "prefer_rust_with_warning" },

	cmdline = {
		keymap = {
			preset = "cmdline",
		},
		completion = {
			list = { selection = { preselect = false } },
			menu = { auto_show = true },
			ghost_text = { enabled = true },
		},
	},
})

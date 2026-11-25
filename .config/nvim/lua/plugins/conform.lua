local jsFormatter = { "prettierd", "prettier", stop_after_first = true }
require("conform").setup({
	default_format_opts = {
		timeout_ms = 3000,
		async = false,
		quiet = false,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		javascript = jsFormatter,
		tyepescript = jsFormatter,
		javascriptreact = jsFormatter,
		typescriptreact = jsFormatter,
		css = jsFormatter,
		html = jsFormatter,
		json = jsFormatter,
		yaml = jsFormatter,
		markdown = jsFormatter,
		less = jsFormatter,
		scss = jsFormatter,
		["markdown.mdx"] = jsFormatter,
		lua = { "stylua" },
		python = { "ruff" },
		cpp = { "clang-format" },
		c = { "clang-format" },
		rust = { "rustfmt" },
		sh = { "shfmt" },
	},
	format_on_save = { lsp_format = "fallback", timeout_ms = 500 },
})

vim.keymap.set({ "n", "v" }, "<Leader>mp", function()
	require("conform").format()
end, { desc = "Format" })

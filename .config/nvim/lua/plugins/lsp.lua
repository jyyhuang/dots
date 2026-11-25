vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	severity_sort = true,
	update_in_insert = true,
})

require("mason").setup()
require("mason-lspconfig").setup({})
require("mason-tool-installer").setup({
	ensure_installed = {
		"tree-sitter-cli",
		"lua-language-server",
		"pylsp",
		"vtsls",
		"rust_analyzer",
		"lua_ls",
		"clangd",
		"cssls",
		"yamlls",

		"ruff",
		"prettier",
		"prettierd",
		"stylua",
		"clang-format",
		"shfmt",
		"eslint-lsp",
	},
	auto_update = false,
	run_on_start = true,
})

local capabilities = {
	workspace = {
		fileOperations = {
			didRename = true,
			willRename = true,
		},
	},
}

vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(capabilities),
})

vim.lsp.config("qmlls", {
	cmd = { "qmlls6" },
})

local Snacks = require("snacks")

vim.keymap.set("n", "gd", function()
	Snacks.picker.lsp_definitions({ jump = { reuse_win = false } })
end, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
vim.keymap.set("n", "gt", Snacks.picker.lsp_type_definitions, { desc = "[G]oto T[y]pe Definition" })
vim.keymap.set("n", "gr", Snacks.picker.lsp_references, { nowait = true, desc = "[G]oto [R]eferences" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set("n", "gk", vim.lsp.buf.signature_help, { desc = "Signature Help" })
vim.keymap.set("n", "rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Prev diagnostic" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })

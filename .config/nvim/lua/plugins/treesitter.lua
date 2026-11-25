local Treesitter = require("nvim-treesitter")

require("treesitter-context").setup({
	separator = "—",
	max_lines = 3,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("TreeSitterSetup", { clear = true }),
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match)

		if not lang or not vim.list_contains(Treesitter.get_available(), lang) then
			return
		end

		local function start()
			if not vim.api.nvim_buf_is_valid(ev.buf) or not pcall(vim.treesitter.start, ev.buf, lang) then
				return
			end

			vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			for _, win in ipairs(vim.fn.win_findbuf(ev.buf)) do
				vim.wo[win][0].foldmethod = "expr"
				vim.wo[win][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
			end
		end

		if vim.list_contains(Treesitter.get_installed(), lang) then
			start()
		else
			Treesitter.install(lang):await(function(err)
				if not err then
					vim.schedule(start)
				end
			end)
		end
	end,
})

vim.keymap.set("n", "gc", function()
	require("treesitter-context").go_to_context()
end, { desc = "Go to context" })

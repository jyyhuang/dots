vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.cmd.packadd("nvim.undotree")
vim.pack.add({
	-- Colorscheme
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	-- Completion
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/saghen/blink.cmp" },
	-- LSP / formatting
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	-- Treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
	-- Git
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/esmuellert/codediff.nvim" },
	-- QOL
	{ src = "https://github.com/goolord/alpha-nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/folke/lazydev.nvim", ft = "lua" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/lewis6991/satellite.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/mikavilpas/yazi.nvim" },
})

require("plugins.colorscheme")
require("plugins.mini")
require("plugins.snacks")
require("plugins.blink")
require("plugins.lsp")
require("plugins.conform")
require("plugins.treesitter")
require("plugins.dashboard")
require("plugins.yazi")
require("plugins.gitsigns")
require("plugins.lualine")
require("plugins.lazydev")
require("plugins.render-markdown")
require("plugins.satellite")

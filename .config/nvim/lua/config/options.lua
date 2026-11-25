vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- basics and visual
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 999
vim.opt.inccommand = "split"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes:2"
vim.opt.cursorline = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.winborder = "rounded"
vim.opt.title = true
vim.opt.mouse = "a"
vim.opt.confirm = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.splitbelow = true
vim.opt.splitright = true

-- identation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Sync system clipboard with Neovim clipboard
vim.opt.clipboard:append("unnamedplus")
vim.opt.isfname:append("@-@")

-- undo
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.undofile = true

-- behavior
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
vim.opt.iskeyword:append("-")
vim.opt.diffopt:append("algorithm:histogram")
vim.opt.virtualedit = "block"
vim.opt.path:append("**")
vim.opt.wildmode = { "longest:full", "full" }
vim.opt.wildignore:append({ "*/node_modules/*", "*/.git/*", "*/dist/*", "*.o", "*.pyc" })

-- list characters
vim.opt.list = true
vim.opt.listchars = {
	tab = "» ",
	trail = "·",
	nbsp = "␣",
	extends = "…",
	precedes = "…",
	leadmultispace = "»   ",
}

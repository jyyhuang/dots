require("mini.surround").setup({})
require("mini.icons").setup()
require("mini.icons").mock_nvim_web_devicons()
require("mini.pairs").setup()

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})

local indentscope = require("mini.indentscope")
indentscope.setup({
	symbol = "»",
	options = { try_as_border = true },
	draw = {
		delay = 50,
		animation = indentscope.gen_animation.linear({ duration = 10, unit = "step" }),
	},
})

require("vim._core.ui2").enable({
	msg = {
        target = "msg",
		targets = {
			shell_out = "pager",
			shell_err = "pager",
			verbose = "pager",
		},
		msg = {
			height = 0.3,
			timeout = 5000,
		},
		pager = {
			height = 0.5,
		},
	},
})

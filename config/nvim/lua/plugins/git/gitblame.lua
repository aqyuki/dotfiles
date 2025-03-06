return {
	"f-person/git-blame.nvim",
	lazy = true,
	event = "BufAdd",
	opts = {
		enabled = true,
		message_template = "<author>, <date> - <summary>",
		date_format = "%Y/%d/%m %H:%M:%S",
		virtual_text_column = 1,
	},
}

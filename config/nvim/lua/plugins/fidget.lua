return {
	"j-hui/fidget.nvim",
	config = function()
		local fidget = require("fidget")
		local notification = require("fidget.notification")
		fidget.setup({})

		vim.notify = notification.notify
	end,
}

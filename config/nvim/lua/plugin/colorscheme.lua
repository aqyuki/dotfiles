--- Onedark theme
---@type "darker" | "cool" | "deep" | "warm" | "warmer"
local style = "darker"

return {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = style,
	},
	config = function(_, opts)
		local onedark = require("onedark")
		onedark.setup(opts)
		onedark.load()
	end,
}

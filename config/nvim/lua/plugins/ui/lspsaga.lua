return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = true,
	event = { "LspAttach" },
	config = function()
		local lspsaga = require("lspsaga")
		lspsaga.setup({
			code_action_lightbulb = {
				enable = false,
			},
			lightbulb = {
				enable = false,
			},
		})
	end,
}

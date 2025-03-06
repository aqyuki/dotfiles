return {
	"kdheepak/lazygit.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	keys = {
		{ mode = "n", "lg", "<cmd>LazyGit<CR>" },
	},
	config = function()
		local lazygit = require("lazygit")
		lazygit.setup({})
	end,
}

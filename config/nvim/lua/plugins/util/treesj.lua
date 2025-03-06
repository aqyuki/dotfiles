return {
	"Wansmer/treesj",
	lazy = true,
	keys = {
		{ mode = "n", "<leader>m", "<cmd>TSJToggle<CR>" },
	},
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("treesj").setup()
	end,
}

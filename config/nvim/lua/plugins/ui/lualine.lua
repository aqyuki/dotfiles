return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = true,
	event = "VimEnter",
	config = function()
		require("lualine").setup({
			options = { theme = "onedark" },
		})
	end,
}

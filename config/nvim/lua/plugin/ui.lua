return {
	-- buffer line
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = { "BufAdd" },
		opts = {},
	},
	-- lua line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = { "VimEnter" },
		opts = {
			options = {
				theme = "onedark",
			},
		},
	},
	-- notification
	{
		"folke/noice.nvim",
		dependencies = {
			"rcarriga/nvim-notify",
		},
		event = { "VimEnter" },
		opts = {
			presets = { inc_rename = true },
		},
	},
	{
		"rcarriga/nvim-notify",
		opts = {},
	},
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "K", "<cmd>Lspsaga hover_doc<CR>" },
			{ "gd", "<cmd>Lspsaga peek_definition<CR>" },
			{ "gr", "<cmd>Lspsaga finder<CR>" },
			{ "ga", "<cmd>Lspsaga code_action<CR>" },
		},
		opts = {
			symbol_in_winbar = { enable = false },
			code_action_lightbulb = { enable = false },
			lightbulb = { enable = false },
		},
	},
	{
		"folke/trouble.nvim",
		keys = {
			{ mode = "n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>" },
		},
		opts = {},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufAdd",
		opts = {},
	},
}

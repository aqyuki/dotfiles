return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		event = "BufAdd",
		build = ":TSUpdate",
		opts = {
			ensure_installed = "all",
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			fold = { enable = true },
		},
		config = function(_, opts)
			local treesitter = require("nvim-treesitter.configs")
			treesitter.setup(opts)
		end,
	},
}

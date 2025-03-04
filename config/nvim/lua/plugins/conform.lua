return {
	"stevearc/conform.nvim",
	lazy = true,
	event = "TextChanged",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports" },
				rust = { "rustfmt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				yaml = { "prettier" },
				json = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}


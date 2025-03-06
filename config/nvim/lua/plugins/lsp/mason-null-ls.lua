local function format()
	vim.lsp.buf.format({ async = true })
end

return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("mason-null-ls").setup({
			handlers = {},
		})

		vim.keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.format({async=true,timeout_ms=3000})<CR>")
	end,
}

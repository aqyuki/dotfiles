local function format()
	vim.lsp.buf.format({ async = true })
end

return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	keys = {
		{ "n", "gf", format },
	},
	config = function(mod)
		mod.setup({
			automatic_setup = true,
			handlers = {},
		})
	end,
}

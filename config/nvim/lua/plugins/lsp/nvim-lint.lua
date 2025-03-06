return {
	"mfussenegger/nvim-lint",
	config = function()
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				local lint = require("lint")
				lint.try_lint()
				lint.try_lint("cspell")
			end,
		})

		vim.api.nvim_create_autocmd({ "InsertLeave" }, {
			callback = function()
				local lint = require("lint")
				lint.try_lint()
				lint.try_lint("cspell")
			end,
		})
	end,
}

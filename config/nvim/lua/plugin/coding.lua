return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		keys = {
			{
				"gf",
				function()
					require("conform").format()
				end,
				desc = "conform format",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua", lsp_format = "fallback" },
				rust = { "rustfmt" },
				go = { "goimports" },
				yaml = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		event = "BufWritePre",
	},
	{
		"smjonas/inc-rename.nvim",
		command = "IncRename",
		keys = { { mode = "n", "gn", ":IncRename " } },
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"kazhala/close-buffers.nvim",
		keys = {
			{ mode = "n", "<leader>w", "<cmd>BDelete this<CR>" },
			{ mode = "n", "<leader>W", "<cmd>BDelete other<CR>" },
			{ mode = "n", "<leader>q", "<cmd>BDelete all<CR>" },
		},
		opts = {
			preserve_window_layout = { "this" },
			next_buffer_cmd = function(windows)
				require("bufferline").cycle(1)
				local bufnr = vim.api.nvim_get_current_buf()

				for _, window in ipairs(windows) do
					vim.api.nvim_win_set_buf(window, bufnr)
				end
			end,
		},
	},
	{
		"numToStr/Comment.nvim",
		event = "InsertEnter",
		opts = {},
	},
	{
		"monaqa/dial.nvim",
		keys = {
			{ mode = "n", "<C-a>", "<cmd>DialIncrement<CR>" },
			{ mode = "n", "<C-x>", "<cmd>DialDecrement<CR>" },
		},
	},
	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			chunk = {
				enable = true,
				duration = 150,
				delay = 100,
			},
			line_num = {
				enable = true,
				style = "#806d9c",
			},
		},
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		command = { "FzfLua" },
		keys = {
			{ mode = "n", "<leader>ff", "<cmd>FzfLua files<CR>" },
			{ mode = "n", "<leader>fp", "<cmd>FzfLua buffers<CR>" },
			{ mode = "n", "<leader>fg", "<cmd>FzfLua live_grep<CR>" },
			{ mode = "n", "<leader>fh", "<cmd>FzfLua oldfiles<CR>" },
		},
		opts = {},
	},
	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ mode = "n", "<leader>lg", "<cmd>LazyGit<CR>" },
		},
	},
}

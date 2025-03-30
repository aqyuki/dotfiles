return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
		keys = {
			{
				-- Find files
				"<leader>ff",
				function()
					local actions = require("telescope.builtin")
					actions.find_files({})
				end,
				desc = "Telescope find file",
			},
			{
				-- Find buffers
				"<leader>fp",
				function()
					local actions = require("telescope.builtin")
					actions.buffers()
				end,
				desc = "Telescope find buffers",
			},
			{
				-- Find text
				"<leader>fg",
				function()
					local actions = require("telescope.builtin")
					actions.live_grep()
				end,
				desc = "Telescopre find text",
			},
			{
				-- Find history
				"<leader>fh",
				function()
					local actions = require("telescope.builtin")
					actions.oldfiles()
				end,
				desc = "Telescope find history",
			},
			-- Find help tags
			{
				"<leader>fh",
				function()
					local actions = require("telescope.builtin")
					actions.help_tags()
				end,
				desc = "Telescope find help tags",
			},
			-- Open file browser
			{
				"<leader>fb",
				function()
					local telescope = require("telescope")

					local function telescope_buffer_dir()
						return vim.fn.expand("%:p:h")
					end

					telescope.extensions.file_browser.file_browser({
						path = "%:p:h",
						cwd = telescope_buffer_dir(),
						respect_gitignore = false,
						hidden = true,
						grouped = true,
						previewer = false,
						initial_mode = "normal",
						layout_config = { height = 40 },
					})
				end,
				desc = "Open File Browser with the path of the current buffer",
			},
		},
		config = function()
			local telescope = require("telescope")
			local config = require("telescope.config")

			local vimgrep_arguments = { unpack(config.values.vimgrep_arguments) }
			table.insert(vimgrep_arguments, "--hidden")
			table.insert(vimgrep_arguments, "--glob")
			table.insert(vimgrep_arguments, "!**/.git/*")

			telescope.setup({
				defaults = {
					theme = "dropdown",
					vimgrep_arguments = vimgrep_arguments,
				},
				extensions = {
					file_browser = {
						hijack_netrw = true,
					},
				},
			})
		end,
	},
}

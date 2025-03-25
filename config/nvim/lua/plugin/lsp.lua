return {
	-- tools
	{
		"williamboman/mason.nvim",
		cmd = { "Mason" },
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },
		event = { "BufAdd" },
		opts = {
			ensure_installed = { "lua_ls", "rust_analyzer", "gopls" },
			automatic_installation = true,
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
					})
				end,
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
						single_file_support = true,
						settings = {
							Lua = {
								runtime = {
									version = "LuaJIT",
									pathStrict = true,
									path = { "?.lua", "?/init.lua" },
								},
								workspace = {
									library = vim.list_extend(vim.api.nvim_get_runtime_file("lua", true), {
										"${3rd}/luv/library",
										"${3rd}/busted/library",
										"${3rd}/luassert/library",
									}),
									checkThirdParty = "Disable",
								},
								completion = {
									workspaceWord = true,
									callSnippet = "Both",
								},
								hint = {
									enable = true,
									setType = false,
									paramType = true,
									paramName = "Disable",
									semicolon = "Disable",
									arrayIndex = "Disable",
								},
								doc = {
									privateName = { "^_" },
								},
								type = {
									castNumberToInteger = true,
								},
								diagnostics = {
									disable = { "incomplete-signature-doc", "trailing-space" },
									-- enable = false,
									groupSeverity = {
										strong = "Warning",
										strict = "Warning",
									},
									groupFileStatus = {
										["ambiguity"] = "Opened",
										["await"] = "Opened",
										["codestyle"] = "None",
										["duplicate"] = "Opened",
										["global"] = "Opened",
										["luadoc"] = "Opened",
										["redefined"] = "Opened",
										["strict"] = "Opened",
										["strong"] = "Opened",
										["type-check"] = "Opened",
										["unbalanced"] = "Opened",
										["unused"] = "Opened",
									},
									unusedLocalExclude = { "_*" },
								},
								format = { enable = false },
							},
						},
					})
				end,
				["rust_analyzer"] = function()
					require("lspconfig").rust_analyzer.setup({
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
						settings = {
							["rust-analyzer"] = {
								diagnostics = {
									enable = true,
								},
								checkOnSave = {
									command = "clippy",
								},
							},
						},
					})
				end,
				["gopls"] = function()
					require("lspconfig").gopls.setup({
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
					})
				end,
			},
		},
	},
}

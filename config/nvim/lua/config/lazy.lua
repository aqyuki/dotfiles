local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- load vim settings
require("config.keymap")
require("config.option")

---@class LazyConfig
local opts = {
	defaults = {
		-- Set this to `true` to have all your plugins lazy-loaded by default.
		-- Only do this if you know what you are doing, as it can lead to unexpected behavior.
		---@type boolean
		lazy = true,
	},
	spec = {
		{ import = "plugin" },
	},
	checker = {
		enabled = true,
		notify = true,
	},
	performance = {
		cache = {
			enabled = true,
		},
	},
	ui = {
		border = "rounded",
	},
}

require("lazy").setup(opts)

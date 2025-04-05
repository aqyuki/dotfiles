-- setup `mapleader` and `maplocalleader`
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- change to normal mode when pressing `jj` or `kk` in insert mode
keymap.set("i", "jj", "<Esc>", opts)
keymap.set("i", "kk", "<Esc>", opts)

-- Change tab
keymap.set("n", "<C-[>", "<cmd>bprev<CR>", opts)
keymap.set("n", "<C-]>", "<cmd>bnext<CR>", opts)

-- Split window
keymap.set("n", "ss", "<cmd>split<CR>", opts)
keymap.set("n", "s-", "<cmd>split<CR>", opts)
keymap.set("n", "sv", "<cmd>vsplit<CR>", opts)
keymap.set("n", "s\\", "<cmd>vsplit<CR>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h", opts)
keymap.set("n", "sj", "<C-w>j", opts)
keymap.set("n", "sk", "<C-w>k", opts)
keymap.set("n", "sl", "<C-w>l", opts)

-- toggle inlay hints
local function toggle_inlay_hint()
	local lsp = vim.lsp
	lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled())
end
keymap.set("n", "<leader>th", toggle_inlay_hint, opts)

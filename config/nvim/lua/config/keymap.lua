-- setup `mapleader` and `maplocalleader`
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- change to normal mode when pressing `jj` or `kk` in insert mode
keymap.set("i", "jj", "<Esc>", opts)
keymap.set("i", "kk", "<Esc>", opts)

-- buffer controll
keymap.set("n", "<C-[>", "<cmd>bprev<CR>", opts)
keymap.set("n", "<C-]>", "<cmd>bnext<CR>", opts)

-- toggle inlay hints
keymap.set("n", "<leader>th", function()
  local lsp = vim.lsp
  lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled())
end, opts)

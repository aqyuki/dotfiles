-- set leader key
vim.g.mapleader = " "

-- common setting
local keymap = vim.keymap
keymap.set("i", "jj", "<esc>")
keymap.set("i", "kk", "<esc>")

-- buffer setting
keymap.set("n", "<C-[>", "<cmd>bprev<CR>")
keymap.set("n", "<C-]>", "<cmd>bnext<CR>")

-- LSP actions
keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
-- keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>") -- replaced by mason-null-ls
keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>")
keymap.set("n", "gn", "<cmd>Lspsaga rename<CR>")
keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "<leader>th", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })

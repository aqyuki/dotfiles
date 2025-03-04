-- set leader key
vim.g.mapleader = ' '

-- common setting
local keymap = vim.keymap
keymap.set("i", "jj", "<esc>")
keymap.set("i", "kk", "<esc>")

-- buffer setting
keymap.set("n", "<C-[>", "<cmd>bprev<CR>")
keymap.set("n", "<C-]>", "<cmd>bnext<CR>")
keymap.set("n", "<leader>bd", "<cmd>bd<CR>")

-- LSP actions
keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
keymap.set('n', 'gd', "<cmd>lua vim.lsp.buf.definition()<CR)")
keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')


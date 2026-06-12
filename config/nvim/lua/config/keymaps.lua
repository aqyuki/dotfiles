local map = vim.keymap.set

-- Change to normal mode
map("i", "jj", "<esc>", { noremap = true, silent = true })

-- Better delete
map("n", "x", '"_x', { noremap = true, silent = true })

-- Incremental/Decremental
map("n", "+", "<C-a>", { noremap = true, silent = true })
map("n", "-", "<C-x>", { noremap = true, silent = true })

-- Move to window using the <command> hjkl keys
map("n", "<D-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<D-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<D-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<D-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using the <command> arrow keys
map("n", "<D-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<D-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<D-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<D-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Toggle terminal
map({ "n", "t" }, "<D-/>", function()
  Snacks.terminal.focus(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })

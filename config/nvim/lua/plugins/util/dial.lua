return {
  "monaqa/dial.nvim",
  lazy = true,
  keys = {
    { mode = "n", "<C-a>", "<cmd>DialIncrement<CR>" },
    { mode = "n", "<C-x>", "<cmd>DialDecrement<CR>" },
  },
}

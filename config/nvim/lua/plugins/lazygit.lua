return {
  "kdheepak/lazygit.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = true,
  keys = {
    { mode = "n", "<leader>lg", "<cmd>LazyGit<CR>" },
  },
  opts = {},
}

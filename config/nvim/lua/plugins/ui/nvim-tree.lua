return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { mode = "n", "<C-b>", "<cmd>NvimTreeToggle<CR>", desc = "NvimTreeをトグルする" },
    { mode = "n", "<C-m>", "<cmd>NvimTreeFocus<CR>", desc = "NvimTreeにフォーカス" },
  },
  config = function()
    require("nvim-tree").setup({
      git = {
        enable = true,
        ignore = true,
      },
    })
  end,
}

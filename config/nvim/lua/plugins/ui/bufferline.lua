return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = true,
  event = "BufAdd",
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup({})
  end,
}

return {
  "navarasu/onedark.nvim",
  lazy = true,
  config = function()
    require("onedark").setup({
      style = "darker",
    })
  end,
}

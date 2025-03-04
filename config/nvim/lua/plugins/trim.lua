return {
  "cappyzawa/trim.nvim",
  lazy = true,
  event = "InsertEnter",
  config = function()
    require("trim").setup {
      trim_last_line = false,
      patterns = {
        [[%s/\n*\%$/\r/]],
      },
    }
  end,
}


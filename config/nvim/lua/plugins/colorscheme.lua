return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    build = function()
      require("nightfox").compile()
    end,
  },
}

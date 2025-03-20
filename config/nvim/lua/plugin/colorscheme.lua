return {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true,
    terminal_colors = true,
  },
  config = function(_, opts)
    local solarized = require("solarized-osaka")
    solarized.setup(opts)
    vim.cmd([[colorscheme solarized-osaka]])
  end,
}

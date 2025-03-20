return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
    integrations = {
      notify = true,
    },
  },
  config = function(_, opts)
    local catppuccin = require("catppuccin")
    catppuccin.setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}

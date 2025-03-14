return {
  "j-hui/fidget.nvim",
  config = function()
    local fidget = require("fidget")
    local notification = require("fidget.notification")
    fidget.setup({
      notification = {
        window = {
          border = "rounded",
        },
      },
      integration = {
        ["nvim-tree"] = {
          enable = true,
        },
      },
    })

    vim.notify = notification.notify
  end,
}

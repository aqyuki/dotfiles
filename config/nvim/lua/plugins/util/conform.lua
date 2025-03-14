return {
  "stevearc/conform.nvim",
  lazy = true,
  event = "TextChanged",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports" },
        rust = { "rustfmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        yaml = { "prettier" },
        json = { "prettier" },
        toml = { "taplo" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
    vim.keymap.set("n", "gf", "<cmd>lua require('conform').format()<CR>")
  end,
}

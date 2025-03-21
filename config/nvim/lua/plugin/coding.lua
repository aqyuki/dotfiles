return {
  -- format
  {
    "stevearc/conform.nvim",
    lazy = true,
    event = "TextChanged",
    keys = {
      {
        "gf",
        function()
          require("conform").format()
        end,
        desc = "conform format",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua", lsp_format = "fallback" },
        rust = { "rustfmt" },
        go = { "goimports" },
        yaml = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },
  -- lint
  { "mfussenegger/nvim-lint" },
  -- Rename symbol
  {
    "smjonas/inc-rename.nvim",
    lazy = true,
    keys = {
      {
        "<leader>gn",
        ":IncRename ",
      },
    },
    opts = {},
  },
  -- support
  {
    "m4xshen/autoclose.nvim",
    lazy = true,
    event = "InsertEnter",
    opts = {},
  },
  {
    "kazhala/close-buffers.nvim",
    lazy = true,
    keys = {
      { mode = "n", "<leader>w", "<cmd>BDelete this<CR>" },
      { mode = "n", "<leader>W", "<cmd>BDelete other<CR>" },
      { mode = "n", "<leader>q", "<cmd>BDelete all<CR>" },
    },
    opts = {
      preserve_window_layout = { "this" },
      next_buffer_cmd = function(windows)
        require("bufferline").cycle(1)
        local bufnr = vim.api.nvim_get_current_buf()

        for _, window in ipairs(windows) do
          vim.api.nvim_win_set_buf(window, bufnr)
        end
      end,
    },
  },
  {
    "numToStr/Comment.nvim",
    lazy = true,
    event = "InsertEnter",
  },
  {
    "monaqa/dial.nvim",
    lazy = true,
    keys = {
      { mode = "n", "<C-a>", "<cmd>DialIncrement<CR>" },
      { mode = "n", "<C-x>", "<cmd>DialDecrement<CR>" },
    },
  },
  {
    "kylechui/nvim-surround",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {},
  },
}

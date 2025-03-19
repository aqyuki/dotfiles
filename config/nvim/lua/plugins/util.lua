return {
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
    "zbirenbaum/copilot.lua",
    lazy = true,
    cmd = "Copilot",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      copilot_node_command = "node",
    },
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

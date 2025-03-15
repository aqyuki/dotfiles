return {
  "kazhala/close-buffers.nvim",
  lazy = true,
  keys = {
    { mode = "n", "<leader>w", "<cmd>BDelete this<CR>" },
    { mode = "n", "<leader>W", "<cmd>BDelete other<CR>" },
    { mode = "n", "<leader>q", "<cmd>BDelete all<CR>" },
  },
  config = function()
    require("close_buffers").setup({
      preserve_window_layout = { "this" },
      next_buffer_cmd = function(windows)
        require("bufferline").cycle(1)
        local bufnr = vim.api.nvim_get_current_buf()

        for _, window in ipairs(windows) do
          vim.api.nvim_win_set_buf(window, bufnr)
        end
      end,
    })
  end,
}

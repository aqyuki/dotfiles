return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    event = "BufAdd",
    opts = {},
  },
  {
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
  },
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = true,
    event = { "LspAttach" },
    opts = {
      symbol_in_winbar = { enable = false },
      code_action_lightbulb = { enable = false },
      lightbulb = { enable = false },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    event = "VimEnter",
    opts = {
      options = { theme = "catppuccin" },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle" },
    keys = {
      { mode = "n", "<C-b>", "<cmd>NvimTreeToggle<CR>", desc = "NvimTreeをトグルする" },
      { mode = "n", "<C-m>", "<cmd>NvimTreeFocus<CR>", desc = "NvimTreeにフォーカス" },
    },
    opts = {
      git = { enable = true, ignore = true },
    },
  },
  {
    "folke/trouble.nvim",
    keys = {
      { mode = "n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>" },
    },
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = "BufAdd",
    opts = {},
  },
}

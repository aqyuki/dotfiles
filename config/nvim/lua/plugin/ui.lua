return {
  -- dashboard
  {
    "goolord/alpha-nvim",
    config = function()
      require("alpha").setup(require("alpha.themes.dashboard").config)
    end,
  },
  -- buffer line
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    event = { "BufAdd" },
    opts = {},
  },
  -- lua line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    event = { "VimEnter" },
    opts = {},
  },
  -- notification
  {
    "folke/noice.nvim",
    dependencies = {
      "rcarriga/nvim-notify",
    },
    lazy = true,
    event = { "VimEnter" },
    opts = {
      presets = { inc_rename = true },
    },
  },
  {
    "rcarriga/nvim-notify",
    lazy = true,
    opts = {},
  },
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = true,
    keys = {
      { "K", "<cmd>Lspsaga hover_doc<CR>" },
      { "<leader>ga", "<cmd>Lspsaga code_action<CR>" },
    },
    opts = {
      symbol_in_winbar = { enable = false },
      code_action_lightbulb = { enable = false },
      lightbulb = { enable = false },
    },
  },
  {
    "folke/trouble.nvim",
    lazy = true,
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

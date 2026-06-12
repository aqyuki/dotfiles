return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "K", false }, -- Disable default keymaps
          },
        },
      },
      setup = {
        -- LazyVim側でSemantic Token Providerを無理やり作成して登録しているが
        -- この処理の最中でnilポインターへのアクセスを行なっているらしくgopls
        -- 起動時に毎回エラーが発生していた。
        -- この処理がなくてもコーディングには影響がないため無効化しておく
        gopls = function() end,
      },
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    event = { "LspAttach" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-mini/mini.icons",
    },
    opts = {
      symbols_in_winbar = { enable = true },
      implement = { enable = true },
      lightbulb = { virtual_text = false },
    },
    keys = {
      { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover document" },
    },
  },
}

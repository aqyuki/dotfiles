return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = true,
  keys = {
    { mode = "n", "<leader>f", "<cmd>lua require('fzf-lua').files()<CR>" },
    { mode = "n", "<leader>p", "<cmd>lua require('fzf-lua').buffers()<CR>" },
    { mode = "n", "<leader>b", "<cmd>lua require('fzf-lua').blines()<CR>" },
    { mode = "n", "<leader>r", "<cmd>lua require('fzf-lua').lsp_references()<CR>" },
    { mode = "n", "<leader>d", "<cmd>lua require('fzf-lua').lsp_definitions()<CR>" },
    { mode = "n", "<leader>D", "<cmd>lua require('fzf-lua').lsp_declarations()<CR>" },
    { mode = "n", "<leader>i", "<cmd>lua require('fzf-lua').lsp_implementations()<CR>" },
    { mode = "n", "<leader>s", "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>" },
    { mode = "n", "<leader>t", "<cmd>lua require('fzf-lua').lsp_typedefs()<CR>" },
    { mode = "n", "<leader>l", "<cmd>lua require('fzf-lua').diagnostics_document()<CR>" },
  },
  config = function()
    require("fzf-lua").setup({
      winopts = {
        height = 0.85,
        width = 0.80,
        row = 0.35,
        col = 0.50,
        border = "rounded",
        fullscreen = false,
      },
    })
    vim.opt.winblend = 5
    vim.opt.termguicolors = true
  end,
}

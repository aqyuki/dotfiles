-- options
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.smartindent = true
opt.autoindent = true
opt.wrap = true
opt.cursorline = true
opt.splitright = true

-- cursor
vim.opt.guicursor = "n-i:block"

-- tab width
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- LSP settings
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true })
vim.lsp.inlay_hint.enable(true)

-- auto command
local autocmd = vim.api.nvim_create_autocmd
autocmd({ "WinEnter", "FocusGained", "BufEnter" }, {
  pattern = "*",
  command = "checktime",
})

autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.wgsl",
  callback = function()
    vim.bo.filetype = "wgsl"
  end,
})

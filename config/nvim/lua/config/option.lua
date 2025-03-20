local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.smartindent = true
opt.autoindent = true
opt.wrap = true
opt.cursorline = true
opt.splitright = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.guicursor = "n-i:block"

-- Language server settings
local lsp = vim.lsp
lsp.handlers["textDocument/publishDiagnostics"] =
  lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true })
lsp.inlay_hint.enable(true)

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

-- theme
vim.cmd.colorscheme("onedark")

-- LSP settings
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })
vim.lsp.inlay_hint.enable(true)

-- auto command
vim.api.nvim_create_autocmd({ "WinEnter", "FocusGained", "BufEnter" }, {
  pattern = "*",
  command = "checktime",
})

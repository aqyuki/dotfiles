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
vim.opt.guicursor = "n-i:ver25"

-- tab width
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- theme
vim.cmd.colorscheme("onedark")

vim.lsp.handlers["textDocument/publishDiagnostics"] =
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })


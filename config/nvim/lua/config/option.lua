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

-- LSP settings
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true })
vim.lsp.inlay_hint.enable(true)

local lspconfig = require("lspconfig")
local server_settings = {
  rust_analyzer = function(config)
    config.settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    }
    lspconfig.rust_analyzer.setup(config)
  end,
  tsserver = function(config)
    config.filetypes = {
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    }
    lspconfig.tsserver.setup(config)
  end,
}

-- default server setup
local function setup_default(server_name, config)
  require("lspconfig")[server_name].setup(config)
end

require("mason-lspconfig").setup_handlers({
  function(server_name)
    local default_setting = {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    }

    if server_settings[server_name] then
      server_settings[server_name](default_setting)
    else
      setup_default(server_name, default_setting)
    end
  end,
})
vim.diagnostic.config()

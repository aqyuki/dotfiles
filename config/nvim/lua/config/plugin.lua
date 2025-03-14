-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins.git" },
    { import = "plugins.lsp" },
    { import = "plugins.theme" },
    { import = "plugins.ui" },
    { import = "plugins.util" },
  },
})

-- LSP settings

-- Rust analyzer setup
local function rust_setup(config)
  config.settings = {
    inlayHints = {
      typeHints = { enable = true },
      parameterHints = { enable = true },
    },
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
    },
  }
  require("lspconfig").rust_analyzer.setup(config)
end

-- custom server settings
local server_settings = {
  rust_analyzer = rust_setup,
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

local ensure_installed = {
  "bash",
  "dockerfile",
  "gitattributes",
  "gitignore",
  "go",
  "gomod",
  "gosum",
  "gowork",
  "proto",
  "rust",
  "sql",
  "json",
  "toml",
  "yaml",
}
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  event = { "BufEnter" },
  build = ":TSUpdate",
  opts = {
    ensure_installed = ensure_installed,
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  },
}

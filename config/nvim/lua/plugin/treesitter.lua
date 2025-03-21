local ensure_installed = {
  "bash",
  "fish",
  "dockerfile",
  "gitattributes",
  "gitignore",
  "go",
  "rust",
  "sql",
  "gomod",
  "gosum",
  "gowork",
  "proto",
  "json",
  "toml",
  "yaml",
}

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = ensure_installed,
    highlight = { enable = true },
    indent = { enable = true },
  },
}

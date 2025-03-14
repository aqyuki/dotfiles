return {
  "github/copilot.vim",
  lazy = true,
  event = { "InsertEnter", "CmdlineEnter" },
  filetypes = {
    markdown = true,
    help = true,
  },
}

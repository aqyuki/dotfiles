return {
  {
    "zbirenbaum/copilot.lua",
    lazy = true,
    commit = "25ab971cb0badf3185d29f68a360c37b48d4e783",
    -- After the following commits, a warning appears when starting the plugin,
    -- as if the certificate verification has failed, so fix the commit hash until it is fixed.
    -- commit = "256393d0737741c460726716cac3a605c45d1c3f",
    pin = true,
    cmd = "Copilot",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      copilot_node_command = "node",
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    opts = {},
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "zbirenbaum/copilot-cmp",
    },
    lazy = true,
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
      local cmp = require("cmp")
      local types = require("cmp.types")

      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      cmp.setup({
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }),
          ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }),
          ["<C-l>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", keyword_length = 1 }, -- LSP
          { name = "copilot" }, -- GitHub Copilot
          { name = "luasnip", keyword_length = 2 }, -- Lua snip
          { name = "buffer", keyword_length = 2 },
          { name = "path" },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline" },
        },
      })
    end,
  },
}

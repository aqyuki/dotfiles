return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
    lazy = true,
    keys = {
      {
        -- Find files
        "<leader>ff",
        function()
          local actions = require("telescope.builtin")
          actions.find_files({})
        end,
        desc = "Telescope find file",
      },
      {
        -- Find buffers
        "<leader>fp",
        function()
          local actions = require("telescope.builtin")
          actions.buffers()
        end,
        desc = "Telescope find buffers",
      },
      {
        -- Find text
        "<leader>fg",
        function()
          local actions = require("telescope.builtin")
          actions.live_grep()
        end,
        desc = "Telescopre find text",
      },
      {
        -- Find history
        "<leader>fh",
        function()
          local actions = require("telescope.builtin")
          actions.oldfiles()
        end,
        desc = "Telescope find history",
      },
      -- Find help tags
      {
        "<leader>fh",
        function()
          local actions = require("telescope.builtin")
          actions.help_tags()
        end,
        desc = "Telescope find help tags",
      },
      -- Open file browser
      {
        "<leader>fb",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
      -- LSP references
      {
        "<leader>gr",
        function()
          local actions = require("telescope.builtin")
          actions.lsp_references()
        end,
        desc = "Telescope LSP references",
      },
      -- LSP definitions
      {
        "<leader>gd",
        function()
          local actions = require("telescope.builtin")
          actions.lsp_definitions()
        end,
        desc = "Telescope LSP definitions",
      },
      -- LSP implementations
      {
        "<leader>gi",
        function()
          local actions = require("telescope.builtin")
          actions.lsp_implementations()
        end,
        desc = "Telescope LSP implementations",
      },
      -- LSP type definitions
      {
        "<leader>gtd",
        function()
          local actions = require("telescope.builtin")
          actions.lsp_type_definitions()
        end,
        desc = "Telescope LSP type definitions",
      },
    },
    opts = {
      defaults = {
        theme = "dropdown",
      },
      extensions = {
        file_browser = {
          hijack_netrw = true,
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
    end,
  },
}

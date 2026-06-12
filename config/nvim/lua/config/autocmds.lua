vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local excluded_filetypes = {
      markdown = true,
      mdx = true,
    }

    if excluded_filetypes[vim.bo.filetype] then
      return
    end

    local view = vim.fn.winsaveview()

    vim.cmd([[%s/\s\+$//e]])

    vim.fn.winrestview(view)
  end,
})

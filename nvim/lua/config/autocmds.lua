vim.api.nvim_create_autocmd({ "TermOpen", "BufWinEnter", "WinEnter" }, {
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
      vim.opt_local.statuscolumn = ""
    end
  end,
})

-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd('normal! g`"zz')
    end
  end,
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

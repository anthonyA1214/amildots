vim.api.nvim_create_autocmd({ "TermOpen", "BufWinEnter", "WinEnter" }, {
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
      vim.opt_local.statuscolumn = ""
    end
  end,
})

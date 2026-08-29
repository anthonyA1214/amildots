return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    animate = { enabled = true },
    bufdelete = { enabled = true },
    picker = { enabled = true },
    statuscolumn = { enabled = true },
    indent = { enabled = true },
  },
}

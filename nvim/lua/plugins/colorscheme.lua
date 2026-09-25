return {
  "EdenEast/nightfox.nvim",
  opts = {
    options = {
      transparent = true,
    },
  },
  config = function(_, opts)
    require("nightfox").setup(opts)
    vim.cmd("colorscheme carbonfox")
  end,
}

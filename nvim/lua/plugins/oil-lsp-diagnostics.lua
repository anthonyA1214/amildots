return {
  "JezerM/oil-lsp-diagnostics.nvim",
  dependencies = { "stevearc/oil.nvim" },
  opts = {
    count = true,
    parent_dirs = true,
    diagnostic_colors = {
      error = "DiagnosticError",
      warn = "DiagnosticWarn",
      info = "DiagnosticInfo",
      hint = "DiagnosticHint",
    },
    diagnostic_symbols = {
      error = "",
      warn = "",
      info = "",
      hint = "󰌶",
    },
  },
}

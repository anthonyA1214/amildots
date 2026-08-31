return {
  "anthonyA1214/oil-lsp-diagnostics.nvim",
  dependencies = { "stevearc/oil.nvim" },
  opts = {
    count = false,
    parent_dirs = true,
    filename_highlight = false,
    only_highest_severity = true,
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

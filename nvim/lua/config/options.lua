-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local icons = require("config.icons")
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.error,
      [vim.diagnostic.severity.WARN] = icons.diagnostics.warn,
      [vim.diagnostic.severity.INFO] = icons.diagnostics.info,
      [vim.diagnostic.severity.HINT] = icons.diagnostics.hint,
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  virtual_text = {
    spacing = 4,
    source = "if_many",
  },
})

local opt = vim.opt

opt.autowrite = true -- Automatically save before commands like :next and :make
opt.termguicolors = true -- Enable 24-bit RGB colors

opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.cursorline = true -- Highlight the current line
opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]] -- Use custom status column

opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus" -- Use system clipboard if not in SSH session

opt.mouse = "a" -- Enable mouse support
opt.mousemoveevent = true -- Enable mouse move events

opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 2 -- Number of spaces per tab
opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
opt.wrap = false -- Disable line wrapping

opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true -- Override ignorecase if search pattern contains uppercase letters

opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Time in milliseconds to wait for a mapped sequence to complete
opt.undofile = true -- Enable persistent undo
opt.undolevels = 10000 -- Set the maximum number of changes that can be undone
opt.updatetime = 200 -- Set the time in milliseconds to wait before writing the swap file to disk

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "EdenEast/nightfox.nvim",
  },
  event = "VeryLazy",
  opts = {
    options = {
      separator_style = "thin",
      hover = {
        enabled = true,
        delay = 0,
        reveal = { "close" },
      },
      diagnostics = "nvim_lsp",
    },
    highlights = function()
      local p = require("nightfox.palette").load("carbonfox")
      local c = {
        bg1 = p.bg1,
        bg2 = p.bg2,
        bg3 = p.bg3,
        fg1 = p.fg1,
        fg2 = p.fg2,
        fg3 = p.fg3,
        blue = p.blue.base,
        green = p.green.base,
        red = p.red.base,
        cyan = p.cyan.base,
        yellow = p.yellow.base,
        orange = p.orange.base,
        magenta = p.magenta.base,
      }

      return {
        fill = { fg = c.fg3, bg = c.bg1 },
        background = { fg = c.fg3, bg = c.bg1 },

        buffer_visible = { fg = c.fg2, bg = c.bg2 },
        buffer_selected = { fg = c.fg1, bg = c.bg3, bold = true },

        tab = { fg = c.fg3, bg = c.bg1 },
        tab_selected = { fg = c.fg1, bg = c.bg3, bold = true },
        tab_separator = { fg = c.bg1, bg = c.bg1 },
        tab_separator_selected = { fg = c.bg3, bg = c.bg3 },
        tab_close = { fg = c.fg3, bg = c.bg1 },

        close_button = { fg = c.fg3, bg = c.bg1 },
        close_button_visible = { fg = c.fg2, bg = c.bg2 },
        close_button_selected = { fg = c.fg1, bg = c.bg3 },

        indicator_selected = { fg = c.blue, bg = c.bg3 },

        separator = { fg = c.bg1, bg = c.bg1 },
        separator_visible = { fg = c.bg1, bg = c.bg2 },
        separator_selected = { fg = c.bg1, bg = c.bg3 },

        modified = { fg = c.orange, bg = c.bg1 },
        modified_visible = { fg = c.orange, bg = c.bg2 },
        modified_selected = { fg = c.orange, bg = c.bg3 },

        duplicate = { fg = c.fg3, bg = c.bg1, italic = true },
        duplicate_visible = { fg = c.fg2, bg = c.bg2, italic = true },
        duplicate_selected = { fg = c.fg1, bg = c.bg3, italic = true },

        pick = { fg = c.red, bg = c.bg1, bold = true },
        pick_visible = { fg = c.red, bg = c.bg2, bold = true },
        pick_selected = { fg = c.red, bg = c.bg3, bold = true },

        hint = { fg = c.cyan, bg = c.bg1 },
        hint_visible = { fg = c.cyan, bg = c.bg2 },
        hint_selected = { fg = c.cyan, bg = c.bg3, bold = true },

        info = { fg = c.blue, bg = c.bg1 },
        info_visible = { fg = c.blue, bg = c.bg2 },
        info_selected = { fg = c.blue, bg = c.bg3, bold = true },

        warning = { fg = c.yellow, bg = c.bg1 },
        warning_visible = { fg = c.yellow, bg = c.bg2 },
        warning_selected = { fg = c.yellow, bg = c.bg3, bold = true },

        error = { fg = c.red, bg = c.bg1 },
        error_visible = { fg = c.red, bg = c.bg2 },
        error_selected = { fg = c.red, bg = c.bg3, bold = true },
      }
    end,
  },
}

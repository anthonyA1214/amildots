return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "EdenEast/nightfox.nvim",
  },
  config = function()
    local lualine = require("lualine")

    local p = require("nightfox.palette").load("carbonfox")
    local c = {
      bg1 = p.bg1,
      bg2 = p.bg2,
      bg3 = p.bg3,
      fg1 = p.fg1,
      blue = p.blue.base,
      green = p.green.base,
      red = p.red.base,
      cyan = p.cyan.base,
      yellow = p.yellow.base,
      orange = p.orange.base,
      magenta = p.magenta.base,
    }

    -- Config
    local config = {
      options = {
        theme = {
          -- We are going to use lualine_c an lualine_x as left and
          -- right section. Both are highlighted by c theme .  So we
          -- are just setting default looks o statusline
          normal = { c = { fg = c.fg1, bg = c.bg1 } },
          inactive = { c = { fg = c.fg1, bg = c.bg1 } },
        },
        -- Disable sections and component separators
        component_separators = "",
        section_separators = "",
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
      diff_mode = function()
        return vim.o.diff == true
      end,
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x at right section
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    ins_left({
      "mode",
      icon = "",
      separator = { right = "" },
      color = function()
        -- auto change color according to neovims mode
        local mode_color = {
          n = c.blue,
          i = c.green,
          v = c.magenta,
          [""] = c.magenta,
          V = c.magenta,
          c = c.yellow,
          R = c.red,
          no = c.blue,
          s = c.cyan,
          S = c.cyan,
          [""] = c.cyan,
          ic = c.green,
          Rv = c.red,
          cv = c.yellow,
          ce = c.yellow,
          r = c.cyan,
          rm = c.cyan,
          ["r?"] = c.cyan,
          ["!"] = c.blue,
          t = c.orange,
        }
        return { fg = c.bg1, bg = mode_color[vim.fn.mode()] }
      end,
    })

    ins_left({
      "branch",
      icon = "",
      separator = { right = "" },
      color = { fg = c.fg1, bg = c.bg2 },
    })

    ins_left({
      "filename",
      separator = { right = "" },
      color = { fg = c.fg1, bg = c.bg3 },
    })

    ins_left({
      "diagnostics",
    })

    ins_right({
      "encoding",
      color = { fg = c.fg1, bg = c.bg1 },
    })

    ins_right({
      "filetype",
      separator = { left = "" },
      color = { fg = c.fg1, bg = c.bg3 },
    })

    ins_right({
      "progress",
      separator = { left = "" },
      color = { fg = c.fg1, bg = c.bg2 },
    })

    ins_right({
      "location",
      separator = { left = "" },
      color = { fg = c.bg1, bg = c.blue, gui = "bold" },
      cond = conditions.buffer_not_empty,
    })

    -- Initialize lualine with config
    lualine.setup(config)
  end,
}

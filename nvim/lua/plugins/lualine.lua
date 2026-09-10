return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    -- Color table for highlights
    -- stylua: ignore
    local colors = {
      bg       = "#161616",
      fg       = "#f2f4f8",
      grey     = "#484848",
      yellow   = "#08bdba",
      cyan     = "#33b1ff",
      darkblue = "#6690d9",
      green    = "#25be6a",
      orange   = "#3ddbd9",
      violet   = "#ff7eb6",
      magenta  = "#be95ff",
      blue     = "#78a9ff",
      red      = "#ee5396",
    }

    -- Config
    local config = {
      options = {
        theme = {
          -- We are going to use lualine_c an lualine_x as left and
          -- right section. Both are highlighted by c theme .  So we
          -- are just setting default looks o statusline
          normal = { c = { fg = colors.fg, bg = colors.bg } },
          inactive = { c = { fg = colors.fg, bg = colors.bg } },
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
      separator = { right = "" },
      color = function()
        -- auto change color according to neovims mode
        local mode_color = {
          n = colors.blue,
          i = colors.green,
          v = colors.magenta,
          [""] = colors.magenta,
          V = colors.magenta,
          c = colors.yellow,
          R = colors.red,
          no = colors.blue,
          s = colors.cyan,
          S = colors.cyan,
          [""] = colors.cyan,
          ic = colors.green,
          Rv = colors.red,
          cv = colors.yellow,
          ce = colors.yellow,
          r = colors.cyan,
          rm = colors.cyan,
          ["r?"] = colors.cyan,
          ["!"] = colors.blue,
          t = colors.orange,
        }
        return { fg = colors.bg, bg = mode_color[vim.fn.mode()] }
      end,
    })

    ins_left({
      "branch",
      icon = "",
      color = { fg = colors.fg, bg = colors.bg },
    })

    ins_left({
      "diagnostics",
    })

    ins_right({
      "encoding",
      color = { fg = colors.fg, bg = colors.bg },
    })

    ins_right({
      "filetype",
      colors = { fg = colors.fg, bg = colors.bg },
    })

    ins_right({
      "progress",
      color = { fg = colors.fg, bg = colors.bg },
    })

    ins_right({
      "location",
      separator = { left = "" },
      color = { fg = colors.bg, bg = colors.blue, gui = "bold" },
      cond = conditions.buffer_not_empty,
    })

    -- Initialize lualine with config
    lualine.setup(config)
  end,
}

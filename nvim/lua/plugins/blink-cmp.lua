return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "saghen/blink.lib",
      "zbirenbaum/copilot.lua",
      "giuxtaposition/blink-cmp-copilot",
      "rafamadriz/friendly-snippets",
    },
    build = function()
      require("blink.cmp").build():pwait()
    end,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      cmdline = {
        keymap = {
          ["<Tab>"] = { "show", "accept" },
        },
        completion = {
          ghost_text = {
            enabled = true,
          },
          menu = {
            auto_show = function(ctx)
              return vim.fn.getcmdtype() == ":"
            end,
          },
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
}

return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "giuxtaposition/blink-cmp-copilot",
      "rafamadriz/friendly-snippets",
    },
    version = "1.*",
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
        default = { "lazydev", "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 150,
            async = true,
          },
        },
      },
    },
  },
}

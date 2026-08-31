return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  opts = {
    options = {
      hover = {
        enabled = true,
        delay = 0,
        reveal = { "close" },
      },
      diagnostics = "nvim_lsp",

      -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
      --   local icons = {
      --     error = "",
      --     warning = "",
      --     info = "",
      --     hint = "󰌶",
      --   }
      --   local order = { "error", "warning", "info", "hint" }
      --   local parts = {}
      --   for _, e in ipairs(order) do
      --     local n = diagnostics_dict[e]
      --     if n then
      --       table.insert(parts, n .. icons[e])
      --     end
      --   end
      --   return table.concat(parts, " ")
      -- end,
    },
  },
}

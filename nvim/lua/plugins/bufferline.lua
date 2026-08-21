local function get_bufferline_keys()
  -- stylua: ignore
  local keys = {
    -- Navigate between buffers
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },

    { "<leader>$", "<cmd>BufferLineGoToBuffer -1<cr>", desc = "Go to Last Buffer" },
    { "<leader>^", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Go to First Buffer" },

  }

  -- Jump to buffer by number
  for i = 1, 9 do
    table.insert(keys, {
      "<leader>" .. i,
      "<cmd>BufferLineGoToBuffer " .. i .. "<cr>",
      desc = "Go to Buffer " .. i,
    })
  end

  return keys
end

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
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " "
            or (e == "warning" and " " or " ")
          s = s .. sym .. n
        end
        return s
      end,
    },
  },
  keys = get_bufferline_keys(),
}

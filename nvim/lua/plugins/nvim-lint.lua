return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    local M = {}

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      python = { "ruff" },
    }

    function M.debounce(ms, fn)
      local timer = assert(vim.uv.new_timer())
      return function(...)
        local argv = { ... }
        timer:start(ms, 0, function()
          timer:stop()
          vim.schedule_wrap(fn)(unpack(argv))
        end)
      end
    end

    function M.lint()
      local names = lint._resolve_linter_by_ft(vim.bo.filetype)
      names = vim.list_extend({}, names)

      -- copied this config from lazyvim

      -- -- add fallbacklinters
      -- if #names == 0 then
      --   vim.list_extend(names, lint.linters_by_ft["_"] or {})
      -- end
      --
      -- -- add global linters
      -- vim.list_extend(names, lint.linters_by_ft["*"] or {})
      --
      -- local ctx = { filename = vim.api.nvim_buf_get_name(0) }
      -- ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")
      --
      -- names = vim.tbl_filter(function(name)
      --   local linter = lint.linters[name]
      --   if not linter then
      --     vim.notify("Linter not found: " .. name, vim.log.levels.WARN)
      --     return false
      --   end
      --   return linter
      --     and not (
      --       type(linter) == "table"
      --       and linter.condition
      --       and not linter.condition(ctx)
      --     )
      -- end, names)

      if #names > 0 then
        lint.try_lint(names)
      end
    end

    vim.api.nvim_create_autocmd(
      { "BufWritePost", "BufReadPost", "InsertLeave" },
      {
        group = vim.api.nvim_create_augroup("nvim_lint", { clear = true }),
        callback = M.debounce(100, M.lint),
      }
    )

    vim.keymap.set("n", "<leader>ll", function()
      M.lint()
    end, { desc = "Trigger linting for current file" })
  end,
}

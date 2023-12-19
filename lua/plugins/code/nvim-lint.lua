local table_contains = require("config.utils").table_contains

return {
  "mfussenegger/nvim-lint",
  event = { "VeryLazy" },
  config = function(_, opts)
    local lint = require("lint")
    lint.linters_by_ft = opts.linters_by_ft
    vim.api.nvim_create_autocmd(opts.events, {
      group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      javascript = { "eslint" },
      typescript = { "eslint" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint" },
    },
  },
}

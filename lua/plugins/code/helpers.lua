local map = require("config.utils").map

local M = {}

M.attachLspKeymaps = function(ev)
  -- Enable completion triggered by <c-x><c-o>
  vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { buffer = ev.buf }
  map("n", "gD", vim.lsp.buf.declaration, opts, "Go to declaration")
  map(
    "n",
    "gd",
    "<cmd>lua vim.lsp.buf.definition()<CR>",
    opts,
    "Go to definition"
  )
  map("n", "K", vim.lsp.buf.hover, opts, "Show symbol information")
  map("n", "gi", vim.lsp.buf.implementation, opts, "Go to implementation")
  map(
    "n",
    "<leader>gt",
    vim.lsp.buf.type_definition,
    opts,
    "Go to type definition"
  )
  map("n", "<leader>rn", vim.lsp.buf.rename, opts, "Rename symbol")
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts, "Code action")
  map({ "n" }, "gr", vim.lsp.buf.references, opts, "References quickfix list")
end

return M

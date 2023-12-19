-- Function to create an auto-command
local M = {}

function M.map(modes, lhs, rhs, opts, desc)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  if opts.remap and not vim.g.vscode then
    opts.remap = nil
  end
  opts.desc = desc or opts.desc -- Add or overwrite the 'desc' key

  vim.keymap.set(modes, lhs, rhs, opts)
end

function M.table_contains(tbl, value)
  for _, v in ipairs(tbl) do
    if v == value then
      return true
    end
  end
  return false
end

return M

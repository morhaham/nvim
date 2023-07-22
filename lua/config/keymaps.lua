-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Resize window using <ctrl><shift> and movement keys
map("n", "<C-S-K>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-S-J>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-S-H>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-S-L>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

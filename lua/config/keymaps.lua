local map = require("config.utils").map

map("n", "<C-S-k>", "<cmd>resize -2<cr>", { desc = "Increase window height" })
map("n", "<C-S-j>", "<cmd>resize +2<cr>", { desc = "Decrease window height" })
map(
  "n",
  "<C-S-h>",
  "<cmd>vertical resize -2<cr>",
  { desc = "Decrease window width" }
)
map(
  "n",
  "<C-S-l>",
  "<cmd>vertical resize +2<cr>",
  { desc = "Decrease window width" }
)

map("n", "<C-l>", "<C-w>l", { desc = "Move to split on the right" })
map("n", "<C-h>", "<C-w>h", { desc = "Move to split on the left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to the split below" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to the split above" })

map(
  "i",
  "<Esc><BS>",
  "<C-w>",
  { desc = "(mac specific) delete word backwards with option backsapce" }
)

map({ "i", "n" }, "<C-s>", "<ESC><cmd>w<CR>", { desc = "Save current buffer" })

map(
  "n",
  "<ESC>",
  "<cmd>noh<CR><ESC>",
  { desc = "Escape to clear search highlight" }
)

map(
  { "n", "v" },
  "<leader>q",
  "<cmd>q!<CR>",
  { desc = "Quit buffer without saving" }
)
map(
  { "n", "v" },
  "<leader>wq",
  "<cmd>wq<CR>",
  { desc = "Save buffer and quit" }
)

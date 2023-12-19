return {
  { "rose-pine/neovim", name = "rose-pine", priority = 1000 },
  {
    "aktersnurra/no-clown-fiesta.nvim",
    name = "no-clown-fiesta",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme no-clown-fiesta]])
    end,
  },
}

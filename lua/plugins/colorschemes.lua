return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "aktersnurra/no-clown-fiesta.nvim",
    name = "no-clown-fiesta",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme no-clown-fiesta")
    end,
  },
  {
    "alligator/accent.vim",
    priority = 1000,
  },
  {
    "p00f/alabaster.nvim",
    priority = 1000,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    priority = 1000,
    --[[ config = function()
      vim.cmd("colorscheme oxocarbon")
    end, ]]
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    --[[ config = function()
      require("onedark").setup({ style = "darker" })
      require("onedark").load()
    end, ]]
  },
}

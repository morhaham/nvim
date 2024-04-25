return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
    config = function()
      require("rose-pine").setup({
        highlight_groups = {
          StatusLineTerm = { fg = "subtle", bg = "surface" },
          StatusLineTermNC = { fg = "muted", bg = "surface", blend = 60 },
        },
      })
      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "aktersnurra/no-clown-fiesta.nvim",
    name = "no-clown-fiesta",
    priority = 1000,
    --[[ config = function()
      vim.cmd("colorscheme no-clown-fiesta")
    end, ]]
  },
  {
    "alligator/accent.vim",
    priority = 1000,
  },
  {
    "p00f/alabaster.nvim",
    priority = 1000,
    --[[ config = function()
      vim.cmd("colorscheme alabaster")
    end, ]]
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
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    --[[ config = function()
      vim.cmd("colorscheme kanagawa-wave")
    end, ]]
  },
  {
    "catppuccin/nvim",
    priority = 1000,
    --[[ config = function()
      vim.cmd("colorscheme catppuccin-mocha")
    end, ]]
  },
  {
    "dasupradyumna/midnight.nvim",
    lazy = false,
    priority = 1000,
    --[[ config = function()
      vim.cmd("colorscheme midnight")
    end, ]]
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    --[[ config = function()
      vim.cmd("colorscheme dracula")
    end, ]]
  },
  {
    "whatyouhide/vim-gotham",
    lazy = false,
    priority = 1000,
    --[[ config = function()
      vim.cmd("colorscheme gotham")
    end, ]]
  },
}

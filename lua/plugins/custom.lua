return {
  {
    "Mofiqul/vscode.nvim",
    config = function()
      local c = require("vscode.colors").get_colors()
      require("vscode").setup({
        -- Alternatively set style in setup
        -- style = 'light
        -- Enable transparent background
        transparent = false,
        -- Override colors (see ./lua/vscode/colors.lua)
        color_overrides = {
          vscBack = "#1e1e1e",
        },
      })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "main",
      })
    end,
  },
  {
    "oxfist/night-owl.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "night-owl",
    },
  },
  {
    "tpope/vim-fugitive",
    config = function()
      -- load the colorscheme here
      vim.cmd.colorscheme("night-owl")
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end,
  },
  "vim-test/vim-test",
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.theme = "night-owl"
      table.remove(opts.sections.lualine_c, 4)
      table.remove(opts.sections.lualine_c, 3)
      table.insert(
        opts.sections.lualine_c,
        3,
        { "filename", path = 3, symbols = { modified = "  ", readonly = "", unnamed = "" } }
      )
    end,
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        format = {
          search_down = { icon = "?" },
          search_up = { icon = "?" },
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      formatting = {
        -- return autocomplete item without icon
        format = function(_, item)
          return item
        end,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
    },
  },
}

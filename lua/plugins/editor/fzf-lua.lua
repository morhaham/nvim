return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader>ff",
      "<cmd>lua require('fzf-lua').files({ resume = true, fd_opts = '--color=never --type f --hidden --follow --no-ignore' })<CR>",
      desc = "Find files",
    },
    {
      "<leader><leader>",
      "<cmd>lua require('fzf-lua').git_files({ resume = true })<CR>",
      desc = "Find git files",
    },
    {
      "<leader>fb",
      '<cmd>lua require("fzf-lua").buffers()<CR>',
      desc = "Find buffers",
    },
    {
      "<leader>fq",
      '<cmd>lua require("fzf-lua").quickfix()<CR>',
      desc = "Find in quickfix list",
    },
    {
      "<leader>fl",
      '<cmd>lua require("fzf-lua").loclist()<CR>',
      desc = "Find in location list",
    },
    {
      "<leader>fa",
      '<cmd>lua require("fzf-lua").args()<CR>',
      desc = "Find in argument list",
    },
    {
      "<leader>g",
      "<cmd>lua require('fzf-lua').live_grep({ resume = true })<CR>",
      desc = "live grep",
    },
    {
      "<leader><C-g>",
      "<cmd>lua require('fzf-lua').live_grep({ cmd = [[rg --color=always --smart-case -uuu ]] })<CR>",
      desc = "live grep no ignores",
    },
  },
}

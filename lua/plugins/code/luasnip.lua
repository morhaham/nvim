return {
  {
    "L3MON4D3/LuaSnip",
    name = "luasnip",
    version = "v2.*",
    dependencies = { "friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "rafamadriz/friendly-snippets",
    name = "friendly-snippets",
  },
}

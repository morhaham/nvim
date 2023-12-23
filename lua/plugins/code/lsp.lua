local has_words_before = require("config.utils").has_words_before
local attachLspKeymaps = require("plugins.code.helpers").attachLspKeymaps

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
    opts = {
      ensure_installed = {
        "stylua",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
    end,
    opts = function()
      local lspconfig = require("lspconfig")
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
      local default_setup = function(server)
        lspconfig[server].setup({
          capabilities = lsp_capabilities,
        })
      end
      return {
        ensure_installed = { "tsserver", "tailwindcss" },
        handlers = { default_setup },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "nvim-cmp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local servers = {
        tsserver = {},
        tailwindcss = {},
      }
      for server_name, config in pairs(servers) do
        lspconfig[server_name].setup(config)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = attachLspKeymaps,
      })

      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        sources = cmp.config.sources({
          { name = "luasnip" },
          { name = "nvim_lsp" },
        }),
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              local entry = cmp.get_selected_entry()
              if not entry then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
              else
                cmp.confirm()
              end
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- that way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
      })
    end,
    keys = {
      {
        "<leader>df",
        "<cmd>lua vim.diagnostic.open_float()<CR>",
        desc = "Show diagnostic float",
      },
      {
        "<leader>d[",
        "<cmd>lua vim.diagnostic.goto_prev()<CR>",
        desc = "Diagnostic prev",
      },
      {
        "<leader>d]",
        "<cmd>lua vim.diagnostic.goto_next()<CR>",
        desc = "Diagnostic next",
      },
      {
        "<leader>dl",
        "<cmd>lua vim.diagnostic.setloclist()<CR>",
        desc = "Diagnostic location list",
      },
    },
  },
}

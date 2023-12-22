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
        ensure_installed = { "tsserver" },
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
      }
      for server_name, config in pairs(servers) do
        lspconfig[server_name].setup(config)
      end

      local map = require("config.utils").map
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          map("n", "gD", vim.lsp.buf.declaration, opts, "Go to declaration")
          map("n", "gd", vim.lsp.buf.definition, opts, "Go to definition")
          map("n", "K", vim.lsp.buf.hover, opts, "Show symbol information")
          map(
            "n",
            "gi",
            vim.lsp.buf.implementation,
            opts,
            "Go to implementation"
          )
          map("n", "gs", vim.lsp.buf.signature_help, opts, "Show signature")
          map(
            "n",
            "<leader>wa",
            vim.lsp.buf.add_workspace_folder,
            opts,
            "Add workspace folder"
          )
          map(
            "n",
            "<leader>wr",
            vim.lsp.buf.remove_workspace_folder,
            opts,
            "Remove workspace folder"
          )
          map("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts, "List workspace folders")
          map(
            "n",
            "<leader>gt",
            vim.lsp.buf.type_definition,
            opts,
            "Go to type definition"
          )
          map("n", "<leader>rn", vim.lsp.buf.rename, opts, "Rename symbol")
          map(
            { "n", "v" },
            "<leader>ca",
            vim.lsp.buf.code_action,
            opts,
            "Code action"
          )
          map(
            "n",
            "gr",
            vim.lsp.buf.references,
            opts,
            "References quickfix list"
          )
        end,
      })
      local cmp = require("cmp")
      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
        },
        mapping = cmp.mapping.preset.insert({
          -- Enter key confirms completion item
          ["<TAB>"] = cmp.mapping.confirm({ select = true }),

          -- Ctrl + space triggers completion menu
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
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

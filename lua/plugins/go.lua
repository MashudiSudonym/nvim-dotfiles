return {
  -- Configure gopls with more advanced settings
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              -- Automatically add imports as you type
              completeUnimported = true,
              -- Run gofumpt (stricter gofmt) on save
              gofumpt = true,
              -- Show more hints and analyses
              analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              codelenses = {
                gc_details = true,
                generate = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
              },
              staticcheck = true,
            },
          },
        },
      },
    },
  },

  -- Enable conform.nvim for automatic formatting with goimports and gofumpt
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt", "golines" },
      },
    },
  },

  -- Configure neotest for Go testing
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-go", "nvim-neotest/nvim-nio" },
    opts = {
      adapters = {
        ["neotest-go"] = {
          dap_go_enabled = true,
          go_test_args = { "-v", "-race" },
        },
      },
    },
  },
}

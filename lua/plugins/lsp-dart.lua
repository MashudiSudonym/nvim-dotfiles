return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dartls = {
          cmd = {
            "dart",
            "language-serve",
            "--protocol=lsp",
          },
        },
      },
    },
  },
}

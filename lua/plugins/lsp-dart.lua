return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dartls = {
          cmd = {
            --"dart", --enable if not use fvm
            vim.fn.getcwd() .. "/home/masrobot/fvm/default/bin/dart",
            "language-serve",
            "--protocol=lsp",
          },
        },
      },
    },
  },
}

return {
  "akinsho/flutter-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    require("flutter-tools").setup({
      -- flutter_path = "/home/masrobot/fvm/default/bin/flutter", -- disable it if not use fvm
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        highlight = "Comment",
        prefix = "//",
        enabled = true,
      },
      dev_log = {
        enabled = true,
        open_cmd = "vsplit",
      },
      lsp = {
        color = { enabled = true },
        on_attach = function(_, _) end, -- placeholder biar ga ada warning
      },
    })

    -- Keymaps Flutter Run spesifik per target
    vim.keymap.set("n", "<leader>frl", "<cmd>FlutterRun -d linux<CR>", { desc = "Flutter Run (Linux)" })
    vim.keymap.set("n", "<leader>frw", "<cmd>FlutterRun -d web<CR>", { desc = "Flutter Run (Web)" })
    vim.keymap.set("n", "<leader>fra", "<cmd>FlutterRun -d android<CR>", { desc = "Flutter Run (Android)" })

    -- Stop Flutter Run
    vim.keymap.set("n", "<leader>fq", "<cmd>FlutterQuit<CR>", { desc = "Flutter Quit" })

    -- Other Flutter Commands
    vim.keymap.set("n", "<leader>fh", "<cmd>FlutterReload<CR>", { desc = "Flutter Hot Reload" })
    vim.keymap.set("n", "<leader>fR", "<cmd>FlutterRestart<CR>", { desc = "Flutter Hot Restart" })
    vim.keymap.set("n", "<leader>fl", "<cmd>FlutterLogToggle<CR>", { desc = "Flutter Logs" })
    vim.keymap.set("n", "<leader>fd", "<cmd>FlutterDevices<CR>", { desc = "Flutter Devices" })
    vim.keymap.set("n", "<leader>fo", "<cmd>FlutterOutlineToggle<CR>", { desc = "Flutter Outline" })
  end,
}

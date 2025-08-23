return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- 👈 tampilkan hidden files sejak awal
        show_hidden_count = true,
        hide_dotfiles = false, -- file diawali . tetap ditampilkan
        hide_gitignored = false, -- file yg di-ignore git tetap ditampilkan
      },
    },
  },
}

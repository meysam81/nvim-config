return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      view = { width = 35 },
      filters = { dotfiles = false },
      renderer = {
        icons = {
          show = {
            file = false,
            folder = false,
            folder_arrow = true,
            git = true,
          },
        },
      },
    })
    vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
    vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", { silent = true })
  end,
}

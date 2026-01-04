return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      view = { width = 35 },
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
      sync_root_with_cwd = true,          -- sync tree root with cwd
      respect_buf_cwd = true,             -- change tree cwd on BufEnter
      update_focused_file = {
        enable = true,                    -- highlight current file
        update_root = true,               -- change root to file's parent
      },
    })
    vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
    vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", { silent = true })
  end,
}

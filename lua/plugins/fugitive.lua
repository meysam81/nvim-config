return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gs", ":Git<CR>", { silent = true })        -- git status
    vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { silent = true })
    vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { silent = true })
    vim.keymap.set("n", "<leader>gl", ":Git log --oneline<CR>", { silent = true })
    vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { silent = true }) -- diff view
  end,
}

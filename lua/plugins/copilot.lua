return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.keymap.set("i", "<C-j>", 'copilot#Accept("<CR>")', { expr = true, replace_keycodes = false })
    vim.keymap.set("i", "<C-]>", "<Plug>(copilot-next)", {})
    vim.keymap.set("i", "<C-k>", "<Plug>(copilot-previous)", {})
    vim.keymap.set("i", "<C-\\>", "<Plug>(copilot-dismiss)", {})
  end,
}

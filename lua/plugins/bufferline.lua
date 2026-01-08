return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = "thin",
        show_buffer_close_icons = true,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
      },
    })

    vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
    vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
    vim.keymap.set("n", "<leader>x", ":bd<CR>", { silent = true }) -- close buffer
    vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { silent = true })
    vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { silent = true })
    vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { silent = true })
    vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", { silent = true })
    vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", { silent = true })
    vim.keymap.set("n", "<leader>xo", ":BufferLineCloseOthers<CR>", { silent = true })
    vim.keymap.set("n", "<leader>xl", ":BufferLineCloseLeft<CR>", { silent = true })
    vim.keymap.set("n", "<leader>xr", ":BufferLineCloseRight<CR>", { silent = true })
  end,
}

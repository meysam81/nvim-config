return {
  "neovim/nvim-lspconfig",
  config = function()
    -- Go
    vim.lsp.config("gopls", {
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_markers = { "go.mod", "go.work", ".git" },
      settings = {
        gopls = {
          analyses = { unusedparams = true },
          staticcheck = true,
          gofumpt = true,
        },
      },
    })

    -- Vue
    vim.lsp.config("vue_ls", {
      cmd = { "vue-language-server", "--stdio" },
      filetypes = { "vue" },
      root_markers = { "package.json", "vue.config.js", ".git" },
    })

    -- TypeScript/JavaScript
    vim.lsp.config("ts_ls", {
      cmd = { "typescript-language-server", "--stdio" },
      filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
      root_markers = { "tsconfig.json", "package.json", ".git" },
    })

    -- Lua
    vim.lsp.config("lua_ls", {
      cmd = { "lua-language-server" },
      filetypes = { "lua" },
      root_markers = { ".luarc.json", ".stylua.toml", ".git" },
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })

    -- Tailwind CSS
    vim.lsp.config("tailwindcss", {
      cmd = { "tailwindcss-language-server", "--stdio" },
      filetypes = { "html", "css", "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
      root_markers = { "tailwind.config.js", "tailwind.config.ts", "postcss.config.js", "package.json", ".git" },
    })


    -- Enable servers
    vim.lsp.enable("gopls")
    vim.lsp.enable("vue_ls")
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("tailwindcss")

    -- Keybindings on LSP attach
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      end,
    })

    -- Diagnostics display
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
    })

    -- Format on save + organize imports for Go
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
        for _, res in pairs(result or {}) do
          for _, action in pairs(res.result or {}) do
            if action.edit then
              vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
            end
          end
        end
        vim.lsp.buf.format({ async = false })
      end,
    })

    -- Format on save for other filetypes
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.lua", "*.vue", "*.ts", "*.js" },
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
}

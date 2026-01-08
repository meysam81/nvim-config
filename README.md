# Neovim Keybindings Cheatsheet

Leader key: `Space`

## File Navigation

| Key        | Action           | Plugin    |
| ---------- | ---------------- | --------- |
| `Ctrl+n`   | Toggle file tree | nvim-tree |
| `Space e`  | Focus file tree  | nvim-tree |
| `Ctrl+p`   | Find files       | telescope |
| `Space fg` | Live grep        | telescope |
| `Space fb` | List buffers     | telescope |
| `Space fr` | LSP references   | telescope |

## Buffers

| Key         | Action          | Plugin     |
| ----------- | --------------- | ---------- |
| `Tab`       | Next buffer     | bufferline |
| `Shift+Tab` | Previous buffer | bufferline |
| `Space x`   | Close buffer    | native     |
| `Space 1-5` | Go to buffer N  | bufferline |

## LSP

| Key        | Action              | Plugin |
| ---------- | ------------------- | ------ |
| `gd`       | Go to definition    | lsp    |
| `gr`       | Find references     | lsp    |
| `gi`       | Find implementation | lsp    |
| `K`        | Hover docs          | lsp    |
| `F2`       | Rename symbol       | lsp    |
| `Space rn` | Rename symbol       | lsp    |
| `Space ca` | Code action         | lsp    |
| `[d`       | Previous diagnostic | lsp    |
| `]d`       | Next diagnostic     | lsp    |

## Completion

| Key          | Action            | Plugin   |
| ------------ | ----------------- | -------- |
| `Ctrl+Space` | Trigger complete  | nvim-cmp |
| `Enter`      | Confirm selection | nvim-cmp |
| `Tab`        | Next item         | nvim-cmp |
| `Shift+Tab`  | Previous item     | nvim-cmp |

## Copilot

| Key      | Action   | Plugin  |
| -------- | -------- | ------- |
| `Ctrl+j` | Accept   | copilot |
| `Ctrl+]` | Next     | copilot |
| `Ctrl+k` | Previous | copilot |
| `Ctrl+\` | Dismiss  | copilot |

## Git

| Key        | Action       | Plugin   |
| ---------- | ------------ | -------- |
| `]c`       | Next hunk    | gitsigns |
| `[c`       | Prev hunk    | gitsigns |
| `Space hp` | Preview hunk | gitsigns |
| `Space hs` | Stage hunk   | gitsigns |
| `Space hr` | Reset hunk   | gitsigns |
| `Space hb` | Blame line   | gitsigns |
| `Space gs` | Git status   | fugitive |
| `Space gc` | Git commit   | fugitive |
| `Space gp` | Git push     | fugitive |
| `Space gl` | Git log      | fugitive |
| `Space gd` | Git diff     | fugitive |

## Debug (DAP)

| Key        | Action                 | Plugin   |
| ---------- | ---------------------- | -------- |
| `F5`       | Continue/Start         | nvim-dap |
| `F10`      | Step over              | nvim-dap |
| `F11`      | Step into              | nvim-dap |
| `F12`      | Step out               | nvim-dap |
| `Space b`  | Toggle breakpoint      | nvim-dap |
| `Space B`  | Conditional breakpoint | nvim-dap |
| `Space dr` | Open REPL              | nvim-dap |
| `Space du` | Toggle DAP UI          | nvim-dap |

## Comments

| Key      | Action                     | Plugin  |
| -------- | -------------------------- | ------- |
| `Ctrl+/` | Toggle comment             | Comment |
| `gcc`    | Comment line               | Comment |
| `gc`     | Comment selection (visual) | Comment |

## Sorting

| Key     | Action                | Plugin    |
| ------- | --------------------- | --------- |
| `:Sort` | Sort selection/motion | sort.nvim |

## General

| Key       | Action                 | Plugin |
| --------- | ---------------------- | ------ |
| `Space q` | Close quickfix         | native |
| `Space t` | Open terminal in split | native |
| `Esc`     | Exit terminal mode     | native |
| `<`       | Indent left (visual)   | native |
| `>`       | Indent right (visual)  | native |

## Windows

| Key        | Action       | Plugin |
| ---------- | ------------ | ------ |
| `Ctrl+w h` | Left window  | native |
| `Ctrl+w j` | Down window  | native |
| `Ctrl+w k` | Up window    | native |
| `Ctrl+w l` | Right window | native |
| `Ctrl+w v` | Vsplit       | native |
| `Ctrl+w s` | Hsplit       | native |

---

## Plugins

lazy.nvim, nvim-tree, telescope, nvim-lspconfig, nvim-cmp, gitsigns, fugitive, bufferline, copilot, nvim-dap, Comment.nvim, sort.nvim

## LSP Servers

gopls (Go), ts_ls (TS/JS), vue_ls (Vue), lua_ls (Lua), tailwindcss, astro, pyright (Python)

## Setup

```bash
./setup.sh
```

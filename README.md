# Neovim Keybindings Cheatsheet

Leader key: `Space`

## File Navigation

| Key        | Action           | Plugin    | Source           |
| ---------- | ---------------- | --------- | ---------------- |
| `Ctrl+n`   | Toggle file tree | nvim-tree | nvim-tree.lua:18 |
| `Space e`  | Focus file tree  | nvim-tree | nvim-tree.lua:19 |
| `Ctrl+p`   | Find files       | telescope | telescope.lua:23 |
| `Space fg` | Live grep        | telescope | telescope.lua:24 |
| `Space fb` | List buffers     | telescope | telescope.lua:25 |
| `Space fr` | LSP references   | telescope | telescope.lua:26 |

## Buffers

| Key         | Action              | Plugin     | Source               |
| ----------- | ------------------- | ---------- | -------------------- |
| `Tab`       | Next buffer         | bufferline | bufferline.lua:16    |
| `Shift+Tab` | Previous buffer     | bufferline | bufferline.lua:17    |
| `Space x`   | Close buffer        | bufferline | bufferline.lua:18    |
| `Space 1-5` | Go to buffer N      | bufferline | bufferline.lua:19-23 |
| `Space xo`  | Close other buffers | bufferline | bufferline.lua:24    |
| `Space xl`  | Close left buffers  | bufferline | bufferline.lua:25    |
| `Space xr`  | Close right buffers | bufferline | bufferline.lua:26    |

## LSP

| Key        | Action              | Plugin | Source      |
| ---------- | ------------------- | ------ | ----------- |
| `gd`       | Go to definition    | lsp    | lsp.lua:71  |
| `gr`       | Find references     | lsp    | lsp.lua:72  |
| `gi`       | Find implementation | lsp    | lsp.lua:73  |
| `K`        | Hover docs          | lsp    | lsp.lua:74  |
| `F2`       | Rename symbol       | native | init.lua:76 |
| `Space rn` | Rename symbol       | lsp    | lsp.lua:75  |
| `Space ca` | Code action         | lsp    | lsp.lua:76  |
| `[d`       | Previous diagnostic | lsp    | lsp.lua:77  |
| `]d`       | Next diagnostic     | lsp    | lsp.lua:78  |

## Completion (in completion menu)

| Key          | Action            | Plugin   | Source     |
| ------------ | ----------------- | -------- | ---------- |
| `Ctrl+Space` | Trigger complete  | nvim-cmp | cmp.lua:17 |
| `Enter`      | Confirm selection | nvim-cmp | cmp.lua:18 |
| `Tab`        | Next item         | nvim-cmp | cmp.lua:19 |
| `Shift+Tab`  | Previous item     | nvim-cmp | cmp.lua:20 |

## Copilot (in insert mode)

| Key      | Action   | Plugin  | Source        |
| -------- | -------- | ------- | ------------- |
| `Ctrl+j` | Accept   | copilot | copilot.lua:5 |
| `Ctrl+]` | Next     | copilot | copilot.lua:6 |
| `Ctrl+k` | Previous | copilot | copilot.lua:7 |
| `Ctrl+\` | Dismiss  | copilot | copilot.lua:8 |

## Git

| Key        | Action       | Plugin   | Source          |
| ---------- | ------------ | -------- | --------------- |
| `]c`       | Next hunk    | gitsigns | gitsigns.lua:16 |
| `[c`       | Prev hunk    | gitsigns | gitsigns.lua:17 |
| `Space hp` | Preview hunk | gitsigns | gitsigns.lua:18 |
| `Space hs` | Stage hunk   | gitsigns | gitsigns.lua:19 |
| `Space hr` | Reset hunk   | gitsigns | gitsigns.lua:20 |
| `Space hb` | Blame line   | gitsigns | gitsigns.lua:21 |
| `Space gs` | Git status   | fugitive | fugitive.lua:4  |
| `Space gc` | Git commit   | fugitive | fugitive.lua:5  |
| `Space gp` | Git push     | fugitive | fugitive.lua:6  |
| `Space gl` | Git log      | fugitive | fugitive.lua:7  |
| `Space gd` | Git diff     | fugitive | fugitive.lua:8  |

## Debug (DAP)

| Key        | Action                 | Plugin   | Source        |
| ---------- | ---------------------- | -------- | ------------- |
| `F5`       | Continue/Start         | nvim-dap | dap.lua:45    |
| `F10`      | Step over              | nvim-dap | dap.lua:46    |
| `F11`      | Step into              | nvim-dap | dap.lua:47    |
| `F12`      | Step out               | nvim-dap | dap.lua:48    |
| `Space b`  | Toggle breakpoint      | nvim-dap | dap.lua:49    |
| `Space B`  | Conditional breakpoint | nvim-dap | dap.lua:50-52 |
| `Space dr` | Open REPL              | nvim-dap | dap.lua:53    |
| `Space du` | Toggle DAP UI          | nvim-dap | dap.lua:54    |
| `Space dc` | Run debug config       | nvim-dap | dap.lua:55-57 |

## Comments

| Key      | Action                     | Plugin  | Source          |
| -------- | -------------------------- | ------- | --------------- |
| `Ctrl+/` | Toggle comment             | Comment | comment.lua:7-8 |
| `gcc`    | Toggle line comment        | Comment | plugin default  |
| `gbc`    | Toggle block comment       | Comment | plugin default  |
| `gc`     | Comment selection (visual) | Comment | plugin default  |
| `gb`     | Block comment (visual)     | Comment | plugin default  |
| `gco`    | Insert comment below       | Comment | plugin default  |
| `gcO`    | Insert comment above       | Comment | plugin default  |
| `gcA`    | Comment at end of line     | Comment | plugin default  |

## Sorting

| Key     | Action                | Plugin    | Source         |
| ------- | --------------------- | --------- | -------------- |
| `:Sort` | Sort selection/motion | sort.nvim | plugin command |

## General

| Key        | Action                 | Plugin | Source      |
| ---------- | ---------------------- | ------ | ----------- |
| `Space q`  | Close quickfix         | native | init.lua:71 |
| `Space t`  | Open terminal in split | native | init.lua:72 |
| `Esc`      | Exit terminal mode     | native | init.lua:73 |
| `<`        | Indent left (visual)   | native | init.lua:74 |
| `>`        | Indent right (visual)  | native | init.lua:75 |
| `Space qq` | Quit all               | native | init.lua:77 |
| `Space qw` | Save all and quit      | native | init.lua:78 |
| `Space qf` | Force quit             | native | init.lua:79 |

## Windows

| Key        | Action       | Plugin |
| ---------- | ------------ | ------ |
| `Ctrl+w h` | Left window  | native |
| `Ctrl+w j` | Down window  | native |
| `Ctrl+w k` | Up window    | native |
| `Ctrl+w l` | Right window | native |
| `Ctrl+w v` | Vsplit       | native |
| `Ctrl+w s` | Hsplit       | native |

## File Tree (in nvim-tree buffer)

Press `g?` inside nvim-tree to see all available keybindings.

| Key     | Action                | Plugin    |
| ------- | --------------------- | --------- |
| `g?`    | Show all keybindings  | nvim-tree |
| `Enter` | Open file/folder      | nvim-tree |
| `Tab`   | Preview file          | nvim-tree |
| `a`     | Create file/directory | nvim-tree |
| `d`     | Delete                | nvim-tree |
| `r`     | Rename                | nvim-tree |
| `x`     | Cut                   | nvim-tree |
| `c`     | Copy                  | nvim-tree |
| `p`     | Paste                 | nvim-tree |
| `y`     | Copy filename         | nvim-tree |
| `Y`     | Copy relative path    | nvim-tree |
| `gy`    | Copy absolute path    | nvim-tree |
| `q`     | Close tree            | nvim-tree |
| `R`     | Refresh               | nvim-tree |
| `H`     | Toggle hidden files   | nvim-tree |
| `I`     | Toggle gitignore      | nvim-tree |

---

## Plugins

lazy.nvim, nvim-tree, telescope, nvim-lspconfig, nvim-cmp, gitsigns, fugitive, bufferline, copilot, nvim-dap, Comment.nvim, sort.nvim

## LSP Servers

gopls (Go), ts_ls (TS/JS), vue_ls (Vue), lua_ls (Lua), tailwindcss, astro, pyright (Python)

## Setup

```bash
./setup.sh
```

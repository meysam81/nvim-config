# Neovim Keybindings Cheatsheet

Leader key: `Space`

## File Navigation

| Key        | Action                                 | Plugin    |
| ---------- | -------------------------------------- | --------- |
| `Ctrl+n`   | Toggle file tree                       | nvim-tree |
| `Space e`  | Focus file tree                        | nvim-tree |
| `Ctrl+p`   | Find file (fuzzy search)               | telescope |
| `Space fg` | Search in files (grep)                 | telescope |
| `Space fb` | List open buffers                      | telescope |
| `Space ee` | Edit file in current directory         | native    |
| `Space ef` | Fuzzy find in current file's directory | telescope |

## Tabs / Buffers

| Key         | Action            | Plugin     |
| ----------- | ----------------- | ---------- |
| `Tab`       | Next tab          | bufferline |
| `Shift+Tab` | Previous tab      | bufferline |
| `Space x`   | Close current tab | bufferline |
| `Space 1-5` | Jump to tab 1-5   | bufferline |

## LSP (Code Intelligence)

| Key        | Action                      | Plugin     |
| ---------- | --------------------------- | ---------- |
| `gd`       | Go to definition            | native lsp |
| `gr`       | Find references             | native lsp |
| `gi`       | Find implementation         | native lsp |
| `K`        | Hover documentation         | native lsp |
| `Space rn` | Rename symbol               | native lsp |
| `Space ca` | Code action                 | native lsp |
| `[d`       | Previous diagnostic/error   | native lsp |
| `]d`       | Next diagnostic/error       | native lsp |
| `Space fr` | Find references (telescope) | telescope  |

## Autocompletion

| Key          | Action              | Plugin   |
| ------------ | ------------------- | -------- |
| `Ctrl+Space` | Trigger completion  | nvim-cmp |
| `Enter`      | Confirm selection   | nvim-cmp |
| `Tab`        | Next suggestion     | nvim-cmp |
| `Shift+Tab`  | Previous suggestion | nvim-cmp |

## GitHub Copilot

| Key      | Action              | Plugin  |
| -------- | ------------------- | ------- |
| `Ctrl+j` | Accept suggestion   | copilot |
| `Ctrl+]` | Next suggestion     | copilot |
| `Ctrl+k` | Previous suggestion | copilot |
| `Ctrl+\` | Dismiss suggestion  | copilot |

## Git

| Key        | Action                   | Plugin   |
| ---------- | ------------------------ | -------- |
| `]c`       | Next git hunk/change     | gitsigns |
| `[c`       | Previous git hunk/change | gitsigns |
| `Space hp` | Preview hunk             | gitsigns |
| `Space hs` | Stage hunk               | gitsigns |
| `Space hr` | Reset hunk               | gitsigns |
| `Space hb` | Blame line               | gitsigns |
| `Space gs` | Git status               | fugitive |
| `Space gc` | Git commit               | fugitive |
| `Space gp` | Git push                 | fugitive |
| `Space gl` | Git log                  | fugitive |
| `Space gd` | Git diff split           | fugitive |

## Terminal

| Key       | Action                 | Plugin |
| --------- | ---------------------- | ------ |
| `Space t` | Open terminal in split | native |
| `Esc`     | Exit terminal mode     | native |

## Visual Mode

| Key       | Action                           | Plugin |
| --------- | -------------------------------- | ------ |
| `v`       | Enter character-wise visual mode | native |
| `V`       | Enter line-wise visual mode      | native |
| `>`       | Indent right (stays in visual)   | native |
| `<`       | Indent left (stays in visual)    | native |
| `{line}G` | Extend selection to line N       | native |

## Find and Replace

| Key                 | Action                         | Plugin |
| ------------------- | ------------------------------ | ------ |
| `:%s/old/new/gc`    | Replace in file (confirm each) | native |
| `:10,20s/old/new/g` | Replace in line range          | native |
| `:cdo s/old/new/gc` | Replace in quickfix results    | native |

## Sorting

| Key            | Action                          | Plugin |
| -------------- | ------------------------------- | ------ |
| `:'<,'>sort`   | Sort selected lines (A-Z)       | native |
| `:'<,'>sort!`  | Sort reverse (Z-A)              | native |
| `:'<,'>sort i` | Sort case insensitive           | native |
| `:'<,'>sort u` | Sort unique (remove duplicates) | native |
| `:'<,'>sort n` | Sort numeric                    | native |

## General

| Key       | Action                                 | Plugin |
| --------- | -------------------------------------- | ------ |
| `Space q` | Close quickfix/bottom pane             | native |
| `:w`      | Save file                              | native |
| `:q`      | Quit                                   | native |
| `:wq`     | Save and quit                          | native |
| `u`       | Undo                                   | native |
| `Ctrl+r`  | Redo                                   | native |
| `.`       | Repeat last action                     | native |
| `%:h`     | Current file's directory (in commands) | native |

## Shell Commands

| Key           | Action                   | Plugin |
| ------------- | ------------------------ | ------ |
| `:!command`   | Run shell command        | native |
| `:r !command` | Insert command output    | native |
| `:term`       | Open terminal            | native |
| `:!go run %`  | Run current file with go | native |

## Window Navigation

| Key        | Action                | Plugin |
| ---------- | --------------------- | ------ |
| `Ctrl+w h` | Move to left window   | native |
| `Ctrl+w j` | Move to bottom window | native |
| `Ctrl+w k` | Move to top window    | native |
| `Ctrl+w l` | Move to right window  | native |
| `Ctrl+w q` | Close current window  | native |
| `Ctrl+w v` | Vertical split        | native |
| `Ctrl+w s` | Horizontal split      | native |

---

## Installed Plugins

| Plugin            | Purpose                  |
| ----------------- | ------------------------ |
| lazy.nvim         | Plugin manager           |
| nvim-tree         | File explorer            |
| nvim-web-devicons | File icons               |
| telescope         | Fuzzy finder             |
| nvim-lspconfig    | LSP configurations       |
| nvim-cmp          | Autocompletion           |
| cmp-nvim-lsp      | LSP completion source    |
| cmp-buffer        | Buffer completion source |
| LuaSnip           | Snippets                 |
| gitsigns          | Git indicators           |
| vim-fugitive      | Git commands             |
| bufferline        | Tab bar                  |
| copilot.vim       | GitHub Copilot           |

## Language Servers Configured

| Server      | Language              |
| ----------- | --------------------- |
| gopls       | Go                    |
| vue_ls      | Vue                   |
| ts_ls       | TypeScript/JavaScript |
| lua_ls      | Lua                   |
| tailwindcss | Tailwind CSS          |

## Dependencies to Install

```bash
# System
sudo dnf install -y neovim ripgrep fd-find lua-language-server

# Go
go install golang.org/x/tools/gopls@latest

# Node
npm install -g typescript typescript-language-server @vue/language-server @tailwindcss/language-server

# Fonts
mkdir -p ~/.local/share/fonts
curl -fLo ~/.local/share/fonts/FiraCodeNerdFont-Regular.ttf \
  https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/FiraCode/Regular/FiraCodeNerdFont-Regular.ttf
fc-cache -fv
```

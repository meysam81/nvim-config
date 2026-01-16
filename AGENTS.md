# AGENTS.md - Neovim Configuration

This is a personal Neovim configuration using lazy.nvim as the plugin manager.
It targets Neovim 0.11+ and uses the native `vim.lsp` API.

## Plan Mode

- Make the plan extremely concise. Sacrifice grammar for the sake of concision.
- At the end of each plan, give me a list of unresolved questions to answer, if any.

## Project Structure

```
~/.config/nvim/
├── init.lua                 # Entry point: bootstrap lazy.nvim, global settings, keymaps
├── lua/plugins/
│   ├── init.lua             # Plugin aggregator (returns array of all plugin specs)
│   ├── bufferline.lua       # Tab/buffer line UI
│   ├── cmp.lua              # Autocompletion (nvim-cmp)
│   ├── comment.lua          # Code commenting
│   ├── copilot.lua          # GitHub Copilot
│   ├── dap.lua              # Debug Adapter Protocol
│   ├── fugitive.lua         # Git commands
│   ├── gitsigns.lua         # Git change indicators
│   ├── lsp.lua              # Language Server Protocol configs
│   ├── nvim-tree.lua        # File explorer
│   ├── sort.lua             # Line/selection sorting
│   └── telescope.lua        # Fuzzy finder
├── setup.sh                 # Cross-platform installation script
└── .pre-commit-config.yaml  # Pre-commit hooks configuration
```

## Build/Lint/Test Commands

This is a Neovim configuration, not a typical application. There are no build or test commands.

### Setup

```bash
./setup.sh                   # Install dependencies and language servers
```

### Pre-commit Hooks

Use github.com/j178/prek instead of pre-commit.

```bash
prek install           # Install git hooks
prek run --all-files   # Run all hooks manually
```

### Configured Linters/Formatters (via prek)

- **oxlint** - JavaScript/TypeScript linting
- **prettier** - Code formatting (via `bunx prettier --write .`)
- **go-fmt/go-imports/golangci-lint** - Go tooling
- **actionlint** - GitHub Actions validation
- **dockerfmt** - Dockerfile formatting
- **commitlint** - Conventional commit enforcement

## Code Style Guidelines

### Lua Formatting

- **Indentation**: 2 spaces (no tabs)
- **Strings**: Double quotes preferred (`"string"`)
- **Trailing commas**: Always include in table definitions
- **Line length**: No strict limit, but keep reasonable
- **Blank lines**: Single blank line between logical sections

### Plugin Specification Pattern

Each plugin file returns a lazy.nvim spec table:

```lua
return {
  "author/plugin-name",
  dependencies = { "dep1", "dep2" },
  config = function()
    -- Setup code here
  end,
}
```

For multiple plugins in one file, return an array:

```lua
return {
  { "plugin1", config = function() ... end },
  { "plugin2", config = function() ... end },
}
```

### Import/Require Patterns

```lua
-- Plugin aggregation in lua/plugins/init.lua
return {
  require("plugins.bufferline"),
  require("plugins.cmp"),
}

-- Lazy-loaded requires inside config functions
config = function()
  local cmp = require("cmp")
  require("nvim-tree").setup({...})
end

-- Access already-loaded modules
local gs = package.loaded.gitsigns
```

### Naming Conventions

| Element             | Convention                | Examples                               |
| ------------------- | ------------------------- | -------------------------------------- |
| Plugin files        | kebab-case                | `nvim-tree.lua`, `gitsigns.lua`        |
| Local variables     | snake_case                | `lazypath`, `config_path`              |
| Table keys          | snake_case                | `root_markers`, `file_ignore_patterns` |
| Keymap descriptions | lowercase inline comments | `-- git status`                        |

### Vim API Usage

```lua
-- Options
vim.opt.number = true              -- Global options
vim.opt_local.shiftwidth = 4       -- Buffer-local options

-- Global variables
vim.g.mapleader = " "

-- Keymaps
vim.keymap.set("n", "<leader>q", ":cclose<CR>", { silent = true })

-- Autocommands
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go" },
  callback = function()
    vim.opt_local.shiftwidth = 4
  end,
})

-- LSP (Neovim 0.11+ API)
vim.lsp.config("gopls", { ... })
vim.lsp.enable("gopls")
```

### Error Handling

```lua
-- Check file existence before loading
if vim.fn.filereadable(config_path) == 1 then
  dofile(config_path)
end

-- Check directory existence (bootstrap pattern)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({...})
end

-- Safe iteration over potentially nil results
for _, res in pairs(result or {}) do
  for _, action in pairs(res.result or {}) do
    -- ...
  end
end
```

## Language-Specific Settings

| Language                               | Tab Width | Tabs/Spaces |
| -------------------------------------- | --------- | ----------- |
| Go                                     | 4         | Tabs        |
| Python                                 | 4         | Spaces      |
| Lua, JS/TS, Vue, HTML, CSS, JSON, YAML | 2         | Spaces      |

## LSP Configuration

Language servers are configured using the native Neovim 0.11+ API in `lua/plugins/lsp.lua`.
Servers must be installed externally (via `setup.sh` or manually).

Configured servers:

- `gopls` - Go
- `ts_ls` - TypeScript/JavaScript
- `vue_ls` - Vue
- `lua_ls` - Lua
- `tailwindcss` - Tailwind CSS
- `astro` - Astro
- `pyright` - Python

Format on save is enabled for: Go, Lua, Vue, TypeScript, JavaScript.

## Key Architectural Decisions

1. **Plugin Manager**: lazy.nvim with auto-bootstrap
2. **LSP Strategy**: Native `vim.lsp` (Neovim 0.11+), no mason.nvim
3. **Completion**: nvim-cmp with LSP and buffer sources
4. **File Navigation**: nvim-tree + telescope
5. **Git Integration**: gitsigns (inline) + fugitive (commands)
6. **Debug Support**: nvim-dap with project-local config (`.nvim-dap.lua`)

## Adding New Plugins

1. Create a new file in `lua/plugins/` (e.g., `lua/plugins/my-plugin.lua`)
2. Return a lazy.nvim spec table
3. Add `require("plugins.my-plugin")` to `lua/plugins/init.lua`

Example:

```lua
-- lua/plugins/my-plugin.lua
return {
  "author/my-plugin",
  dependencies = { "required-dep" },
  config = function()
    require("my-plugin").setup({
      option = "value",
    })
    vim.keymap.set("n", "<leader>mp", ":MyPluginCommand<CR>", { silent = true })
  end,
}
```

## Commit Message Convention

This repository uses [Conventional Commits](https://www.conventionalcommits.org/).
Commit messages are enforced via commitlint prek hook.

Format: `<type>(<scope>): <description>`

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture

This is a Neovim configuration managed by [lazy.nvim](https://github.com/folke/lazy.nvim).

**Boot sequence**: `init.lua` → `lua/config/lazy.lua` (bootstraps lazy.nvim, loads `options` / `keymaps` / `autocmd`, then auto-imports every file under `lua/plugins/` as a plugin spec)

**Directory layout**:

- `lua/config/` — core settings loaded before any plugin: `options.lua`, `keymaps.lua`, `autocmd.lua`
- `lua/plugins/` — one file per plugin or group; each returns a lazy.nvim spec table and is auto-imported
- `lazy-lock.json` — pinned plugin commits; commit this after `:Lazy update`

## Plugin Overview

| File                 | Plugin(s)                                                                          |
| -------------------- | ---------------------------------------------------------------------------------- |
| `lsp.lua`            | mason.nvim + mason-lspconfig (pyright, ruff, ts_ls, lua_ls) + mason-tool-installer |
| `cmp.lua`            | nvim-cmp + LuaSnip + friendly-snippets                                             |
| `conform.lua`        | conform.nvim — format on save (ruff / prettier / stylua)                           |
| `treesitter.lua`     | nvim-treesitter (branch: `main`)                                                   |
| `telescope.lua`      | telescope.nvim + fzf-native                                                        |
| `neo-tree.lua`       | neo-tree.nvim — file explorer with git status                                      |
| `bufferline.lua`     | bufferline.nvim + nvim-web-devicons                                                |
| `lualine.lua`        | lualine.nvim — statusline                                                          |
| `git.lua`            | vim-fugitive + gitsigns.nvim + lazygit.nvim (floating window)                      |
| `trouble.lua`        | trouble.nvim — diagnostics panel                                                   |
| `toggleterm.lua`     | toggleterm.nvim (float direction default)                                          |
| `which-key.lua`      | which-key.nvim — keybinding discovery (press `<leader>` and wait)                  |
| `ui.lua`             | fidget.nvim + indent-blankline + nvim-notify + noice.nvim                          |
| `flash.lua`          | flash.nvim — jump navigation                                                       |
| `surround.lua`       | nvim-surround                                                                      |
| `venv_lsp.lua`       | venv-lsp.nvim — Python venv auto-detection for pyright                             |
| `kanagawa.lua`       | kanagawa.nvim (wave theme, activated in `lazy.lua`)                                |
| `comment.lua`        | Comment.nvim                                                                       |
| `nvim-autopairs.lua` | nvim-autopairs                                                                     |

## Adding a Plugin

Create `lua/plugins/<name>.lua` returning a lazy.nvim spec table. It is auto-imported — no registration needed anywhere else.

---

## Key Reference

Leader key: `<Space>`

### General

| Key           | Action                 |
| ------------- | ---------------------- |
| `<leader>w`   | Save file              |
| `<leader>q`   | Quit window            |
| `<leader>h`   | Clear search highlight |
| `<C-h/j/k/l>` | Move between splits    |

### File Explorer (Neo-tree)

| Key          | Action                          |
| ------------ | ------------------------------- |
| `<leader>e`  | Toggle Neo-tree sidebar         |
| `<leader>nf` | Reveal current file in Neo-tree |

### Buffers (bufferline)

| Key          | Action                     |
| ------------ | -------------------------- |
| `<Tab>`      | Next buffer                |
| `<S-Tab>`    | Previous buffer            |
| `<leader>bc` | Close buffer               |
| `<leader>bp` | Pick buffer (visual label) |

### Find / Search (Telescope)

| Key          | Action              |
| ------------ | ------------------- |
| `<leader>ff` | Find files          |
| `<leader>fg` | Live grep (ripgrep) |
| `<leader>fb` | Open buffers        |
| `<leader>fh` | Help tags           |

### LSP (active on `LspAttach`)

| Key          | Action                        |
| ------------ | ----------------------------- |
| `gd`         | Go to definition              |
| `gr`         | References                    |
| `K`          | Hover documentation           |
| `<leader>cr` | Rename symbol                 |
| `<leader>ca` | Code action (normal & visual) |

### Completion (nvim-cmp)

| Key         | Action                               |
| ----------- | ------------------------------------ |
| `<C-Space>` | Trigger completion manually          |
| `<CR>`      | Confirm selection                    |
| `<Tab>`     | Next item / expand or jump snippet   |
| `<S-Tab>`   | Previous item / jump back in snippet |

### Code

| Key                   | Action                       |
| --------------------- | ---------------------------- |
| `<leader>cf`          | Format buffer (conform.nvim) |
| `gcc`                 | Toggle line comment          |
| `gc` + motion         | Toggle comment over motion   |
| `gbc` / `gb` + motion | Block comment                |
| `ys{motion}{char}`    | Add surround                 |
| `cs{old}{new}`        | Change surround              |
| `ds{char}`            | Delete surround              |

### Navigation (Flash)

| Key | Mode      | Action                         |
| --- | --------- | ------------------------------ |
| `s` | n / x / o | Jump to any visible position   |
| `S` | n / x / o | Jump to Treesitter node        |
| `r` | o         | Remote Flash (operator target) |
| `R` | o / x     | Treesitter search              |

### Git (gitsigns — buffer-local on attach)

| Key          | Action               |
| ------------ | -------------------- |
| `]h` / `[h`  | Next / previous hunk |
| `<leader>gp` | Preview hunk         |
| `<leader>gs` | Stage hunk           |
| `<leader>gr` | Reset hunk           |
| `<leader>gu` | Undo stage hunk      |
| `<leader>gS` | Stage entire buffer  |
| `<leader>gR` | Reset entire buffer  |
| `<leader>gd` | Diff against index   |
| `<leader>gb` | Toggle inline blame  |
| `<leader>gg` | Open LazyGit (float) |

### Diagnostics (Trouble)

| Key          | Action                       |
| ------------ | ---------------------------- |
| `<leader>dd` | Toggle workspace diagnostics |
| `<leader>df` | Toggle buffer diagnostics    |

### Terminal (ToggleTerm)

| Key          | Action                              |
| ------------ | ----------------------------------- |
| `<C-\>`      | Toggle terminal (default direction) |
| `<leader>tt` | Toggle terminal                     |
| `<leader>tf` | Floating terminal                   |
| `<leader>th` | Horizontal terminal                 |
| `<leader>tv` | Vertical terminal                   |

---

## LSP / Python Setup

- pyright, ruff, ts_ls, lua_ls are auto-installed by mason-lspconfig on first launch.
- mason-tool-installer auto-installs prettier and stylua for conform.nvim.
- `venv-lsp.nvim` detects the active virtualenv and points pyright at it (Python files only).

## Formatting (conform.nvim)

Runs automatically on every save. Manual trigger: `<leader>cf`.

| Filetype                                     | Formatter                              |
| -------------------------------------------- | -------------------------------------- |
| Python                                       | `ruff_format`, `ruff_organize_imports` |
| JS / TS / JSX / TSX / JSON / YAML / Markdown | `prettier`                             |
| Lua                                          | `stylua`                               |

## Updating Plugins

```
:Lazy update
```

Then commit `lazy-lock.json`.

# nvim config

Lua-based neovim config using [lazy.nvim](https://github.com/folke/lazy.nvim). Plugins auto-install on first launch.

## Setup

```
./setup.sh
```

Checks for prerequisites (nvim 0.10+, git, cc, make, ripgrep) and symlinks `~/.config/nvim` to this directory.

Optional: install a [Nerd Font](https://www.nerdfonts.com/) for file icons.

## Structure

```
nvim/
├── init.lua              # Bootstrap lazy.nvim, load modules
├── lua/
│   ├── options.lua       # Core vim options
│   ├── keymaps.lua       # Key mappings
│   └── plugins/
│       ├── colorscheme.lua   # tokyonight
│       ├── telescope.lua     # Fuzzy finder
│       ├── treesitter.lua    # Syntax highlighting
│       ├── lsp.lua           # LSP, mason, completion
│       ├── ui.lua            # Lualine, gitsigns
│       └── editor.lua        # Neo-tree, autopairs, comments
```

## Key mappings

Leader is `<Space>`.

| Key | Action |
|---|---|
| `<C-t>` | Toggle file explorer (neo-tree) |
| `<leader>ff` | Find files (telescope) |
| `<leader>fg` | Live grep (telescope) |
| `<leader>fb` | Buffers (telescope) |
| `<leader>fh` | Help tags (telescope) |
| `<leader>h` | Clear search highlight |
| `<C-h/j/k/l>` | Window navigation |
| `gd` | Go to definition |
| `gi` | Go to implementation |
| `K` | Hover docs (built-in) |
| `grn` | Rename symbol (built-in) |
| `gra` | Code action (built-in) |
| `grr` | Go to references (built-in) |
| `<leader>d` | Line diagnostics |
| `[d` / `]d` | Prev/next diagnostic |
| `gc` | Toggle line comment |
| `gb` | Toggle block comment |

Arrow keys are disabled.

## LSP

Mason auto-installs these language servers:

- **ts_ls** — TypeScript/JavaScript
- **gopls** — Go
- **lua_ls** — Lua

Completion is handled by nvim-cmp with `<Tab>`/`<S-Tab>` to cycle and `<CR>` to confirm.

### TypeScript native preview

If you have `tsgo` on your PATH (from `@typescript/native-preview`), it will be used instead of `ts_ls` automatically. Install it with:

```
npm install -g @typescript/native-preview
```

No config changes needed — the LSP config detects the binary at startup.

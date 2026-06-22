# nvim-config

My personal Neovim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim). Colorscheme: Ayaka. Leader key: `Space`.

## Requirements

- **Neovim** ≥ 0.10
- **[ripgrep](https://github.com/BurntSushi/ripgrep)** — live grep (`brew install ripgrep`)
- **[fd](https://github.com/sharkdp/fd)** — file finding (`brew install fd`)
- **[lazygit](https://github.com/jesseduffield/lazygit)** — git popup (`brew install lazygit`)
- **A [Nerd Font](https://www.nerdfonts.com/)** — for icons in the UI
- A C compiler (`gcc` / `clang`) — required by treesitter to compile parsers

### LSP servers (installed via Mason on first launch)

| Language | Server |
|----------|--------|
| Python | `basedpyright`, `ruff` |
| Rust | `rust_analyzer` |
| TypeScript / JS | `vtsls` |

Mason handles installation — run `:Mason` inside Neovim to manage servers.

## Setup

```bash
# Back up existing config if you have one
mv ~/.config/nvim ~/.config/nvim.bak

# Clone directly into place
git clone https://github.com/azhou555/nvim-config.git ~/.config/nvim
```

On first launch, lazy.nvim will bootstrap itself and install all plugins automatically. Treesitter parsers and LSP servers will install in the background.

## Plugin highlights

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [fzf-lua](https://github.com/ibhagwan/fzf-lua) | Fuzzy finding (files, grep, buffers) |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client configuration |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatting |
| [neogit](https://github.com/NeogitOrg/neogit) + [diffview](https://github.com/sindrets/diffview.nvim) | Git UI |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Inline git blame + hunk management |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | File explorer (edit filesystem like a buffer) |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | Tree explorer |
| [flash.nvim](https://github.com/folke/flash.nvim) | Jump motions with labels |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | Surround text objects |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap popup (press `Space` and wait) |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Dashboard, terminal, notifications, zen mode |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics panel |

## Keybinds

> Press `<Space>` and wait ~300ms to open the which-key popup showing all leader bindings.

### Navigation

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Move between splits |
| `<C-d>` / `<C-u>` | Scroll down / up (cursor centered) |
| `n` / `N` | Next / prev search result (centered) |
| `<S-l>` / `<S-h>` | Next / prev buffer |
| `]]` / `[[` | Next / prev word reference |

### Find — fzf-lua (`<leader>f`)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fr` | Recent files |
| `<leader>fs` | Grep word under cursor |
| `<leader>f/` | Search in current buffer |
| `<leader>fh` | Help tags |
| `<leader>fk` | Keymaps |
| `<leader>fd` / `<leader>fD` | Document / workspace diagnostics |
| `<leader>ft` | TODOs |

### LSP (`<leader>l`)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | References |
| `gi` | Implementation |
| `gy` | Type definition |
| `K` | Hover docs |
| `<C-k>` | Signature help |
| `<leader>lr` | Rename symbol |
| `<leader>la` | Code action |
| `<leader>ls` | Document symbols |
| `<leader>lW` | Workspace symbols |
| `<leader>lf` | Format buffer |
| `<leader>li` | Toggle inlay hints |
| `<leader>lm` | Open Mason |
| `]d` / `[d` | Next / prev diagnostic |

### Git (`<leader>g`)

| Key | Action |
|-----|--------|
| `<leader>gs` | Neogit status |
| `<leader>gg` | Lazygit popup |
| `<leader>gd` / `<leader>gD` | Diffview open / close |
| `<leader>gFh` | File history (current file) |
| `<leader>gf` | Git files (fzf) |
| `<leader>gc` | Git commits (fzf) |
| `<leader>gb` | Toggle inline blame |
| `]h` / `[h` | Next / prev hunk |
| `<leader>ghs` | Stage hunk |
| `<leader>ghr` | Reset hunk |
| `<leader>ghp` | Preview hunk |
| `<leader>ghd` | Diff this |
| `ih` (text obj) | Select hunk (visual / operator) |

### File Explorers

| Key | Action |
|-----|--------|
| `<leader>e` | Oil (parent dir) |
| `<leader>E` | Oil (cwd) |
| `<leader>n` | Neo-tree toggle |
| `<leader>nf` | Neo-tree reveal current file |
| `<leader>ng` | Neo-tree git status |
| `-` (in Oil) | Go up to parent |
| `<CR>` (in Oil) | Open |
| `g.` (in Oil) | Toggle hidden files |

### Treesitter — Text Objects

| Key | Action |
|-----|--------|
| `af` / `if` | Around / inside function |
| `ac` / `ic` | Around / inside class |
| `aa` / `ia` | Around / inside parameter |
| `ab` / `ib` | Around / inside block |
| `]f` / `[f` | Next / prev function start |
| `]c` / `[c` | Next / prev class |
| `<C-space>` | Expand treesitter selection |
| `<bs>` | Shrink treesitter selection |
| `<leader>sp` / `<leader>sP` | Swap parameter forward / back |

### Flash — Motions

| Key | Action |
|-----|--------|
| `s` | Jump anywhere with labels |
| `S` | Treesitter node select with labels |
| `r` (operator) | Remote flash (act on distant target) |
| `R` (operator / visual) | Treesitter search |

### Editing

| Key | Action |
|-----|--------|
| `ys{motion}{char}` | Add surround |
| `cs{old}{new}` | Change surround |
| `ds{char}` | Delete surround |
| `<M-e>` | Autopair fast wrap |
| `<C-l>` / `<C-h>` | Snippet jump forward / back |
| `>` / `<` (visual) | Indent / dedent (keep selection) |
| `J` / `K` (visual) | Move selection down / up |
| `p` (visual) | Paste without clobbering register |

### Trouble (`<leader>t`)

| Key | Action |
|-----|--------|
| `<leader>td` | Workspace diagnostics |
| `<leader>tD` | Buffer diagnostics |
| `<leader>ts` | Symbols panel |
| `<leader>tq` | Quickfix list |
| `]t` / `[t` | Next / prev TODO |

### Folds

| Key | Action |
|-----|--------|
| `zR` / `zM` | Open / close all folds |
| `zr` / `zm` | Fold less / more |
| `zK` | Peek fold under cursor |

### UI / Misc

| Key | Action |
|-----|--------|
| `<leader>tt` | Float terminal |
| `<leader>tT` | Bottom terminal |
| `<Esc><Esc>` | Exit terminal mode |
| `<leader>uz` | Zen mode |
| `<leader>uT` | Twilight (dim inactive code) |
| `<leader>un` | Dismiss notifications |
| `<leader>uh` | Notification history |
| `<leader>cr` | Make it rain (cellular automaton) |
| `<leader>cg` | Game of life (cellular automaton) |
| `<C-s>` | Save |
| `<Esc>` | Clear search highlight |
| `<leader>q` / `<leader>Q` | Quit / force quit all |
| `<leader>cR` | Rename file |
| `<leader>bp` | Pin buffer |

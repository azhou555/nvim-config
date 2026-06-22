# Neovim Keybinds

Leader key: `<Space>`

Tip: press `<Space>` and wait 300ms to open the which-key popup showing all leader bindings.

## Navigation

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Move between splits |
| `<C-d>` / `<C-u>` | Scroll down / up (cursor stays centered) |
| `n` / `N` | Next / prev search result (centered) |
| `J` (normal) | Join lines (cursor stays in place) |
| `<S-l>` / `<S-h>` | Next / prev buffer |
| `]]` / `[[` | Next / prev word reference |

## Find — fzf-lua (`<leader>f`)

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

## LSP (`<leader>l`)

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

## Git (`<leader>g`)

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

## File Explorers

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

## Treesitter — Text Objects

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

## Flash — Motions

| Key | Action |
|-----|--------|
| `s` | Jump anywhere with labels |
| `S` | Treesitter node select with labels |
| `r` (operator) | Remote flash (act on distant target) |
| `R` (operator / visual) | Treesitter search |

## Editing

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

## Trouble (`<leader>t`)

| Key | Action |
|-----|--------|
| `<leader>td` | Workspace diagnostics |
| `<leader>tD` | Buffer diagnostics |
| `<leader>ts` | Symbols panel |
| `<leader>tq` | Quickfix list |
| `]t` / `[t` | Next / prev TODO |

## Folds

| Key | Action |
|-----|--------|
| `zR` / `zM` | Open / close all folds |
| `zr` / `zm` | Fold less / more |
| `zK` | Peek fold under cursor |

## UI / Misc

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
| `<leader>cR` | Rename file (snacks) |
| `<leader>bp` | Pin buffer |

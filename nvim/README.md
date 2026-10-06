# dotfiles.nvim

Neovim config (lives in this repo at `nvim/`). Requires Neovim >= 0.11.
MIT-licensed, see `LICENSE` at repo root.

## Requirements

- Neovim >= 0.11 (`nvim --version`; guard in `nvim/init.lua` stops older versions early)
- `git`, C compiler (`gcc`), `ripgrep`, `fzf`, `fd`
- `clangd` for C/C++ (system install is enough; custom `CLANGD_PATH` env is respected)
- Nerd Font for icons (nvim-tree, lualine)
- `blink.cmp` uses `prefer_rust_with_warning` fuzzy: works without a Rust toolchain, warns in `:checkhealth` if the native lib can't build

### CachyOS / Arch

```bash
sudo pacman -S neovim git base-devel ripgrep fzf fd clang
```

### Ubuntu (24.04 stock apt gives 0.9.5, not enough)

Install current Neovim via tarball (x86_64 below; ARM64 uses `nvim-linux-arm64.tar.gz`):

```bash
cd /tmp
curl -fL -o nvim-linux-x86_64.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
```

Then deps:

```bash
sudo apt install git build-essential ripgrep fzf fd-find clangd
# fd on Ubuntu is fdfind — link only if needed (handles both names):
if ! command -v fd >/dev/null && command -v fdfind >/dev/null; then
  mkdir -p ~/.local/bin
  ln -sf $(command -v fdfind) ~/.local/bin/fd
fi
# ensure ~/.local/bin is on PATH
```

Alternatives: `sudo snap install nvim --classic`, or AppImage from `neovim/neovim` releases.

## Setup (copy)

```bash
git clone https://github.com/berkaysahiin/dotfiles.git ~/dotfiles
mkdir -p ~/.config
cp -r ~/dotfiles/nvim ~/.config/nvim
nvim
# inside: :Lazy sync, :checkhealth
```

Update later with `git -C ~/dotfiles pull` + copy again.

Treesitter parsers install on first file open (`nvim/lua/plugins/treesitter.lua`).
`nvim/lazy-lock.json` is committed for reproducible installs; `:Lazy sync` restores exact pins.

## Keymaps

Global (`nvim/lua/config/keymaps.lua`):

| Key     | Action                 |
| ------- | ---------------------- |
| `Ctrl-B`| Toggle file tree      |
| `Ctrl-T`| Toggle floating term  |
| `Ctrl-L`| Toggle diagnostics    |

fzf (`nvim/lua/plugins/fzf.lua`, lazy-loaded on keypress):

| Key     | Action                 |
| ------- | ---------------------- |
| `Ctrl-F`| Find files (fzf)      |
| `Ctrl-S`| Live grep (fzf)       |

LSP, set on `LspAttach` (`nvim/lua/config/lsp-setup.lua`): `gd gD gr gi K Ctrl-k <leader>rn <leader>ca [d ]d <leader>e`.
Git hunks (`gitsigns`): `]c [c <leader>hs <leader>hr <leader>hp <leader>hb <leader>hd <leader>tb`.
Trouble: `<leader>xx <leader>xX <leader>cs <leader>cl <leader>xL <leader>xQ`. Notes: `<leader>n`.

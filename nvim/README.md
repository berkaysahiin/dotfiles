# nvim

Personal Neovim config. Requires Neovim >= 0.11.

## Requirements

- Neovim >= 0.11 (`nvim --version`)
- `git`, C compiler (`gcc`), `ripgrep`, `fzf`, `fd`
- `clangd` for C/C++
- Nerd Font for icons (nvim-tree, lualine).

### CachyOS / Arch

```bash
sudo pacman -S neovim git base-devel ripgrep fzf fd clangd
```

### Ubuntu (24.04 stock apt gives 0.9.5, not enough)

Install current Neovim via tarball:

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
# fd on Ubuntu is fdfind, symlink if needed:
ln -sf $(command -v fdfind) ~/.local/bin/fd
```

Alternatives: `sudo snap install nvim --classic`, or AppImage from `neovim/neovim` releases.

## Setup

```bash
git clone <your-repo> ~/.config/nvim
nvim
# inside: :Lazy sync, :checkhealth
```

Treesitter parsers install on first file open (`lua/plugins/treesitter.lua`).

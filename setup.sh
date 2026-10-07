#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")"

if [[ "${1:-}" == "--help" ]]; then
  echo "usage: $0 [distribution]"
  echo "Available distributions: ubuntu (default)"
  exit
fi

DISTRIBUTION=${1:-"ubuntu"}

git config --global core.autocrlf false
git config --global core.eol lf

# dependencies
case $DISTRIBUTION in
  ubuntu)
    sudo apt-get update
    sudo apt-get install -y \
      zsh stow git curl unzip build-essential \
      neovim \
      eza bat fd-find ripgrep fzf zoxide starship git-delta shellcheck
  ;;
  *)
    echo "unsupported distribution: $DISTRIBUTION" >&2
    exit 1
  ;;
esac

# Debian/Ubuntu ship bat and fd under different names
mkdir -p "$HOME/.local/bin"
command -v batcat >/dev/null && ln -sf "$(command -v batcat)" "$HOME/.local/bin/bat"
command -v fdfind >/dev/null && ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"

# delta as git pager
if command -v delta >/dev/null; then
  git config --global core.pager delta
  git config --global interactive.diffFilter "delta --color-only"
  git config --global delta.navigate true
  git config --global merge.conflictStyle zdiff3
fi

# zsh plugin manager
if [[ ! -d "$HOME/.antidote" ]]; then
  git clone --depth=1 https://github.com/mattmc3/antidote.git "$HOME/.antidote"
fi

# default shell zsh
if [[ "$(getent passwd "$USER" | cut -d: -f7)" != "$(command -v zsh)" ]]; then
  sudo chsh -s "$(command -v zsh)" "$USER"
fi

# back up real (non-symlink) dotfiles that would conflict with stow
backup="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"
for f in .zshrc .zsh .config/nvim .config/starship.toml; do
  if [[ -e "$HOME/$f" && ! -L "$HOME/$f" ]]; then
    mkdir -p "$backup/$(dirname "$f")"
    mv "$HOME/$f" "$backup/$f"
    echo "backed up ~/$f to $backup/$f"
  fi
done

# leftover from the powerlevel10k setup
[[ -L "$HOME/.p10k.zsh" ]] && rm "$HOME/.p10k.zsh"

# symlink all dotfiles; ~/.config must be a real directory so stow
# links only our entries instead of folding the whole directory
mkdir -p "$HOME/.config"
stow --restow --target="$HOME" configs

# neovim plugins
nvim --headless "+Lazy! sync" +qa

echo "installation done"
if [[ -d "$HOME/.oh-my-zsh" ]]; then
  echo "note: ~/.oh-my-zsh is no longer used and can be removed"
fi

exec zsh

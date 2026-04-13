#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$1" dst="$2"
  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -e "$dst" ]; then
    echo "Backing up existing $dst -> ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi
  ln -s "$src" "$dst"
  echo "Linked $dst -> $src"
}

# tmux
link "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"

# tmuxinator
mkdir -p "$HOME/.tmuxinator"
link "$DOTFILES/tmuxinator/mac.yml" "$HOME/.tmuxinator/mac.yml"
link "$DOTFILES/tmuxinator/vps.yml" "$HOME/.tmuxinator/vps.yml"

echo "Done!"

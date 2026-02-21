#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Install homebrew if missing
if ! command -v brew >/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Brewfile dependencies
ln -fs "$DOTFILES_DIR/Brewfile" ~/Brewfile
brew bundle --file=~/Brewfile

# Git
ln -fs "$DOTFILES_DIR/git/ignore_global" ~/.gitignore_global
cp -n "$DOTFILES_DIR/git/config_defaults" ~/.gitconfig 2>/dev/null || true

# Symlinks
ln -fs "$DOTFILES_DIR/tmux/tmux.conf" ~/.tmux.conf
ln -fs "$DOTFILES_DIR/finicky.js" ~/.finicky.js

# Per-tool setup
"$DOTFILES_DIR/zsh/setup.sh"
"$DOTFILES_DIR/nvim/setup.sh"

echo ""
echo "All done. Open a new shell to get started."

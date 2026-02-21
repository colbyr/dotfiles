#!/usr/bin/env bash
set -euo pipefail

ZSH_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTFILES_DIR="$(dirname "$ZSH_DIR")"
STARSHIP_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/starship.toml"

# Check prerequisites
missing=()
command -v brew >/dev/null || missing+=("homebrew")
command -v zsh >/dev/null || missing+=("zsh")

if [ ${#missing[@]} -gt 0 ]; then
  echo "Missing prerequisites:"
  for dep in "${missing[@]}"; do
    echo "  - $dep"
  done
  echo ""
  echo "Install them before continuing."
  exit 1
fi

# Install starship and antidote
echo "Installing starship and antidote..."
brew install starship antidote

# Symlink starship config
if [ -L "$STARSHIP_CONFIG" ]; then
  current_target=$(readlink "$STARSHIP_CONFIG")
  if [ "$current_target" = "$DOTFILES_DIR/starship.toml" ]; then
    echo "Symlink already correct: $STARSHIP_CONFIG -> $DOTFILES_DIR/starship.toml"
  else
    echo "Updating symlink: $STARSHIP_CONFIG -> $DOTFILES_DIR/starship.toml (was $current_target)"
    rm "$STARSHIP_CONFIG"
    ln -s "$DOTFILES_DIR/starship.toml" "$STARSHIP_CONFIG"
  fi
elif [ -e "$STARSHIP_CONFIG" ]; then
  echo "$STARSHIP_CONFIG already exists and is not a symlink."
  echo "Back it up and re-run, or remove it:"
  echo "  mv $STARSHIP_CONFIG ${STARSHIP_CONFIG}.bak"
  exit 1
else
  mkdir -p "$(dirname "$STARSHIP_CONFIG")"
  ln -s "$DOTFILES_DIR/starship.toml" "$STARSHIP_CONFIG"
  echo "Created symlink: $STARSHIP_CONFIG -> $DOTFILES_DIR/starship.toml"
fi

# Write .zshrc from defaults
if [ -e "$HOME/.zshrc" ]; then
  echo "$HOME/.zshrc already exists — skipping (review $ZSH_DIR/rc_defaults for the template)"
else
  cp "$ZSH_DIR/rc_defaults" "$HOME/.zshrc"
  echo "Created ~/.zshrc from rc_defaults"
fi

echo ""
echo "Done. Open a new shell to pick up the changes."

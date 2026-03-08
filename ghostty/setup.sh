#!/usr/bin/env bash
set -euo pipefail

GHOSTTY_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/ghostty"

# Check prerequisites
if ! command -v ghostty >/dev/null && [ ! -d "/Applications/Ghostty.app" ]; then
  echo "Ghostty not found. Install it from https://ghostty.org"
  exit 1
fi

# Set up symlink
CONFIG_FILE="$CONFIG_DIR/config"
if [ -L "$CONFIG_FILE" ]; then
  current_target=$(readlink "$CONFIG_FILE")
  if [ "$current_target" = "$GHOSTTY_DIR/config" ]; then
    echo "Symlink already correct: $CONFIG_FILE -> $GHOSTTY_DIR/config"
  else
    echo "Updating symlink: $CONFIG_FILE -> $GHOSTTY_DIR/config (was $current_target)"
    rm "$CONFIG_FILE"
    ln -s "$GHOSTTY_DIR/config" "$CONFIG_FILE"
  fi
elif [ -e "$CONFIG_FILE" ]; then
  echo "$CONFIG_FILE already exists and is not a symlink."
  echo "Back it up and re-run, or remove it:"
  echo "  mv $CONFIG_FILE ${CONFIG_FILE}.bak"
  exit 1
else
  mkdir -p "$CONFIG_DIR"
  ln -s "$GHOSTTY_DIR/config" "$CONFIG_FILE"
  echo "Created symlink: $CONFIG_FILE -> $GHOSTTY_DIR/config"
fi

echo ""
echo "Done. Ghostty picks up config changes on save — no restart needed."

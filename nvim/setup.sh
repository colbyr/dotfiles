#!/usr/bin/env bash
set -euo pipefail

NVIM_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

# Check prerequisites
missing=()
command -v nvim >/dev/null || missing+=("nvim (0.10+)")
command -v git >/dev/null || missing+=("git")
command -v cc >/dev/null || missing+=("cc (C compiler for telescope-fzf-native)")
command -v make >/dev/null || missing+=("make")
command -v rg >/dev/null || missing+=("ripgrep (for telescope live_grep)")

if [ ${#missing[@]} -gt 0 ]; then
  echo "Missing prerequisites:"
  for dep in "${missing[@]}"; do
    echo "  - $dep"
  done
  echo ""
  echo "Install them before continuing."
  exit 1
fi

# Check nvim version
nvim_version=$(nvim --version | head -1 | grep -oE '[0-9]+\.[0-9]+')
required="0.10"
if [ "$(printf '%s\n' "$required" "$nvim_version" | sort -V | head -1)" != "$required" ]; then
  echo "nvim $nvim_version found, but 0.10+ is required."
  exit 1
fi

# Set up symlink
if [ -L "$CONFIG_DIR" ]; then
  current_target=$(readlink "$CONFIG_DIR")
  if [ "$current_target" = "$NVIM_DIR" ]; then
    echo "Symlink already correct: $CONFIG_DIR -> $NVIM_DIR"
  else
    echo "Updating symlink: $CONFIG_DIR -> $NVIM_DIR (was $current_target)"
    rm "$CONFIG_DIR"
    ln -s "$NVIM_DIR" "$CONFIG_DIR"
  fi
elif [ -e "$CONFIG_DIR" ]; then
  echo "$CONFIG_DIR already exists and is not a symlink."
  echo "Back it up and re-run, or remove it:"
  echo "  mv $CONFIG_DIR ${CONFIG_DIR}.bak"
  exit 1
else
  mkdir -p "$(dirname "$CONFIG_DIR")"
  ln -s "$NVIM_DIR" "$CONFIG_DIR"
  echo "Created symlink: $CONFIG_DIR -> $NVIM_DIR"
fi

echo ""
echo "Done. Open nvim — plugins will install on first launch."
echo ""
echo "Optional: install a Nerd Font for icons (https://www.nerdfonts.com/)"

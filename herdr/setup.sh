#!/usr/bin/env bash
set -euo pipefail

HERDR_DIR="$(cd "$(dirname "$0")" && pwd)"
CLI_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/herdr"
APP_CONFIG_DIR="${HERDR_APP_HOME:-$HOME/.config/herdr-app}"

link() {
  local source_file="$1" config_file="$2"
  if [ -L "$config_file" ] && [ "$(readlink "$config_file")" = "$source_file" ]; then
    echo "Symlink already correct: $config_file -> $source_file"
    return
  fi
  if [ -e "$config_file" ] && [ ! -L "$config_file" ]; then
    cp "$config_file" "$config_file.bak"
    echo "Backed up $config_file to $config_file.bak"
  fi
  # Swap via rename: a running Herdr recreates a missing file with defaults immediately.
  ln -sfn "$source_file" "$config_file.tmp"
  mv -f "$config_file.tmp" "$config_file"
  echo "Linked $config_file -> $source_file"
}

if command -v herdr >/dev/null; then
  mkdir -p "$CLI_CONFIG_DIR"
  link "$HERDR_DIR/config.toml" "$CLI_CONFIG_DIR/config.toml"
else
  echo "herdr CLI not found; skipping CLI config."
fi

if command -v herdr-app >/dev/null || [ -d "/Applications/Herdr.app" ]; then
  # Only person-owned files; Herdr manages AGENTS.md, frame/, layouts, mods and its shipped themes itself.
  mkdir -p "$APP_CONFIG_DIR/themes"
  cd "$HERDR_DIR/app"
  for name in keys.json settings.json programs.json themes/*.json; do
    [ -e "$name" ] || continue
    link "$HERDR_DIR/app/$name" "$APP_CONFIG_DIR/$name"
  done
else
  echo "Herdr.app not found; skipping app config."
fi

echo ""
echo "Done. Herdr.app applies changes live; run 'herdr server reload-config' for the CLI."

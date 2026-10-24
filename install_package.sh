#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_DIR="$SCRIPT_DIR/packages/ankify-typst"

case "$(uname -s)" in
  Darwin)
    DATA_DIR="$HOME/Library/Application Support"
    ;;
  *)
    DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"
    ;;
esac

DEST="$DATA_DIR/typst/packages/local/ankify/0.1.1"

mkdir -p "$DEST"
cp -R "$PACKAGE_DIR/." "$DEST/"

printf 'Installed ankify Typst package to %s\n' "$DEST"

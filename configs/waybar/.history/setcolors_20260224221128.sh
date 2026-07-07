#!/usr/bin/env bash
# setcolors.sh — Generate Material You colors from a wallpaper and reload waybar
# Usage: setcolors.sh /path/to/wallpaper.jpg

set -euo pipefail

IMAGE="${1:-}"

if [[ -z "$IMAGE" ]]; then
    echo "Usage: setcolors.sh <image-path>" >&2
    exit 1
fi

if [[ ! -f "$IMAGE" ]]; then
    echo "Error: file not found: $IMAGE" >&2
    exit 1
fi

echo "→ Setting wallpaper: $IMAGE"
swww img "$IMAGE"

echo "→ Running matugen on: $IMAGE"
matugen image "$IMAGE"

echo "→ Reloading waybar..."
killall -q waybar || true
sleep 0.3
waybar &
disown

echo "✓ Done"

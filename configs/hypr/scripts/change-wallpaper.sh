#!/usr/bin/env bash
# change-wallpaper.sh — set wallpaper, regenerate matugen colors, reload waybar
# Usage: change-wallpaper.sh <path-to-image>

WALLPAPER="${1:-$HOME/.config/hypr/wallpaper.jpg}"

# 1. Set wallpaper via swww
awww img "$WALLPAPER" \
    --transition-type fade \
    --transition-fps 60 \
    --transition-duration 1

# 2. Detect if wallpaper is desaturated/grayscale
#    Sample average HSV saturation — if below 0.12 (12%), use monochrome scheme
SCHEME=$(python3 - "$WALLPAPER" <<'PYEOF'
import sys
from PIL import Image

img = Image.open(sys.argv[1]).convert("RGB").resize((64, 64))
pixels = list(img.getdata())
total_sat = 0.0
for r, g, b in pixels:
    mx = max(r, g, b) / 255.0
    mn = min(r, g, b) / 255.0
    total_sat += (mx - mn) / mx if mx > 0 else 0.0
avg_sat = total_sat / len(pixels)
print("scheme-monochrome" if avg_sat < 0.12 else "scheme-tonal-spot")
PYEOF
)

# 3. Regenerate colors
matugen -q -t "$SCHEME" image "$WALLPAPER"

# 4. For monochrome scheme: primary_fixed_dim is dark gray (invisible on dark bg),
#    but tertiary holds the light color — swap wb_fg and wb_accent so fg is light
if [[ "$SCHEME" == "scheme-monochrome" ]]; then
    python3 - ~/.config/waybar/colors.css <<'PYEOF'
import re, sys
text = open(sys.argv[1]).read()
fg  = re.search(r'(@define-color wb_fg\s+)(#[0-9a-fA-F]+);', text).group(2)
acc = re.search(r'(@define-color wb_accent\s+)(#[0-9a-fA-F]+);', text).group(2)
text = re.sub(r'(@define-color wb_fg\s+)#[0-9a-fA-F]+;', rf'\g<1>{acc};', text)
text = re.sub(r'(@define-color wb_accent\s+)#[0-9a-fA-F]+;', rf'\g<1>{fg};', text)
open(sys.argv[1], 'w').write(text)
PYEOF
fi

# 5. Reload waybar CSS in-place (no bar restart, no flicker)
pkill -SIGUSR2 waybar

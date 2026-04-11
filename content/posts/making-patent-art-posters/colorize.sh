#!/bin/bash

# Usage: ./svgbatch.sh input.svg colors.txt
# 
# colors.txt format (one scheme per line):
#   #BGCOLOR #LINECOLOR
# Example:
#   #003153 #FFFFFF
#   #FDF6E3 #000000
#   #1E1E1E #FDF6E3

INPUT="$1"
COLORFILE="$2"

DPI=600
WIDTH_IN=11
HEIGHT_IN=14
WIDTH_PX=$(echo "$WIDTH_IN * $DPI" | bc)
HEIGHT_PX=$(echo "$HEIGHT_IN * $DPI" | bc)

if [[ -z "$INPUT" || -z "$COLORFILE" ]]; then
  echo "Usage: $0 input.svg colors.txt"
  exit 1
fi

if [[ ! -f "$INPUT" ]]; then
  echo "Error: SVG file '$INPUT' not found"
  exit 1
fi

if [[ ! -f "$COLORFILE" ]]; then
  echo "Error: color file '$COLORFILE' not found"
  exit 1
fi

# Output dir: same location as input SVG
OUTDIR="$(dirname "$INPUT")"
BASENAME="$(basename "${INPUT%.*}")"

LINE_NUM=0

while IFS= read -r line || [[ -n "$line" ]]; do
  # Skip empty lines and comments
  [[ -z "$line" ]] && continue

  LINE_NUM=$((LINE_NUM + 1))

  BG_COLOR=$(echo "$line" | awk '{print $1}')
  LINE_COLOR=$(echo "$line" | awk '{print $2}')

  if [[ -z "$BG_COLOR" || -z "$LINE_COLOR" ]]; then
    echo "Skipping line $LINE_NUM: invalid format '$line'"
    continue
  fi

  # Sanitize color values for use in filename (strip #)
  BG_SAFE="${BG_COLOR//#/}"
  LINE_SAFE="${LINE_COLOR//#/}"

  OUTPUT="${OUTDIR}/${BASENAME}_bg${BG_SAFE}_line${LINE_SAFE}.png"

  echo "[$LINE_NUM] BG: $BG_COLOR  Lines: $LINE_COLOR  →  $(basename "$OUTPUT")"

  # Work on a temp SVG copy
  TMPSVG=$(mktemp /tmp/svgbatch_XXXXXX.svg)
  cp "$INPUT" "$TMPSVG"

  # --- Inject background and recolor via Python (handles multiline SVG tags) ---
  python3 - "$TMPSVG" "$LINE_COLOR" "$BG_COLOR" <<'PYEOF'
import sys
import re
from xml.etree import ElementTree as ET

filepath   = sys.argv[1]
line_color = sys.argv[2]
bg_color   = sys.argv[3]

# Parse preserving namespaces
ET.register_namespace('', 'http://www.w3.org/2000/svg')
ET.register_namespace('xlink', 'http://www.w3.org/1999/xlink')

tree = ET.parse(filepath)
root = tree.getroot()

ns = 'http://www.w3.org/2000/svg'
tag = lambda t: f'{{{ns}}}{t}'

# --- Get canvas dimensions from viewBox or width/height ---
viewbox = root.get('viewBox')
if viewbox:
    parts = viewbox.replace(',', ' ').split()
    vx, vy, vw, vh = parts[0], parts[1], parts[2], parts[3]
else:
    vx, vy = '0', '0'
    vw = root.get('width', '100%').replace('px','').replace('mm','').replace('pt','')
    vh = root.get('height','100%').replace('px','').replace('mm','').replace('pt','')

# --- Remove existing background rect if present ---
for elem in root.findall(f'.//{tag("rect")}[@id="background"]'):
    parent = next((p for p in root.iter() if elem in list(p)), root)
    parent.remove(elem)

# --- Insert background rect as first child of root ---
bg_rect = ET.Element(tag('rect'))
bg_rect.set('id', 'background')
bg_rect.set('x', vx)
bg_rect.set('y', vy)
bg_rect.set('width', vw)
bg_rect.set('height', vh)
bg_rect.set('fill', bg_color)
root.insert(0, bg_rect)

# --- Recolor all elements except background ---
color_attrs = ('fill', 'stroke')
hex_re = re.compile(r'^#?[0-9a-fA-F]{3,6}$')

for elem in root.iter():
    if elem.get('id') == 'background':
        continue

    # Handle style attribute
    style = elem.get('style', '')
    if style:
        def recolor_style(m):
            prop, val = m.group(1), m.group(2)
            if val.lower() == 'none' or val.lower() == 'inherit':
                return m.group(0)
            return f'{prop}{line_color}'
        style = re.sub(r'((?:fill|stroke)\s*:\s*)([^;}"]+)', recolor_style, style)
        elem.set('style', style)

    # Handle direct fill/stroke attributes
    for attr in color_attrs:
        val = elem.get(attr)
        if val and val.lower() not in ('none', 'inherit', 'transparent') and hex_re.match(val):
            elem.set(attr, line_color)

tree.write(filepath, xml_declaration=True, encoding='unicode')
print(f"  Recolored: bg={bg_color} lines={line_color}")
PYEOF

  # --- Export via Inkscape at exact pixel dimensions ---
  inkscape \
    --export-filename="$OUTPUT" \
    --export-dpi="$DPI" \
    --export-width="$WIDTH_PX" \
    --export-height="$HEIGHT_PX" \
    "$TMPSVG" 2>/dev/null

  rm "$TMPSVG"

  if [[ -f "$OUTPUT" ]]; then
    echo "    ✓ Saved: $OUTPUT"
  else
    echo "    ✗ Failed: $OUTPUT"
  fi

done < "$COLORFILE"

echo ""
echo "Done. $LINE_NUM color scheme(s) processed."

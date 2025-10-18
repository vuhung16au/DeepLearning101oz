#!/usr/bin/env bash

set -euo pipefail

# Convert base cover image to multiple target sizes using ImageMagick.
# Requirements: ImageMagick 7+ (magick) or 6 (convert) available in PATH.


ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && cd .. && pwd)"
IMG_DIR="$ROOT_DIR/images"
BASE_NAME="DeepLearning101-cover.png"
BASE_PATH="$IMG_DIR/$BASE_NAME"

if [[ ! -f "$BASE_PATH" ]]; then
  echo "Error: Base image not found at: $BASE_PATH" >&2
  exit 1
fi

# Pick ImageMagick command
if command -v magick >/dev/null 2>&1; then
  IM_CMD=(magick convert)
elif command -v convert >/dev/null 2>&1; then
  IM_CMD=(convert)
else
  echo "Error: ImageMagick 'magick' or 'convert' not found in PATH." >&2
  exit 1
fi

# Target sizes at 300 DPI (pixels). We fill and center-crop to size.
# - A4:     210 x 297 mm  => 2480 x 3508
# - A5:     148 x 210 mm  => 1748 x 2480
# - A6:     105 x 148 mm  => 1240 x 1748
# - Letter: 8.5 x 11 in   => 2550 x 3300
# - B5:     182 x 257 mm  => 2149 x 3035 (rounded)
# - Trade:  6 x 9 in      => 1800 x 2700

SIZE_A4=2480x3508
SIZE_A5=1748x2480
SIZE_A6=1240x1748
SIZE_Letter=2550x3300
SIZE_B5=2149x3035
SIZE_Trade=1800x2700

# Function: resize, fill, and center-crop/pad to exact WxH
convert_fill() {
  local src="$1" dst="$2" size="$3"
  # Use ^ to fill the box, then center and extent to exact size
  "${IM_CMD[@]}" "$src" \
    -colorspace sRGB \
    -resize "${size}^" \
    -gravity center \
    -extent "$size" \
    -strip \
    "$dst"
}

echo "Converting covers in: $IMG_DIR"

# 1) Copy A4 exactly as a direct copy from base (no resample), per request
cp -f "$BASE_PATH" "$IMG_DIR/DeepLearning101-cover-A4.png"
echo "Wrote $IMG_DIR/DeepLearning101-cover-A4.png (copied)"

# 2) Convert to the rest using the base image
convert_fill "$BASE_PATH" "$IMG_DIR/DeepLearning101-cover-A5.png" "$SIZE_A5"
echo "Wrote $IMG_DIR/DeepLearning101-cover-A5.png ($SIZE_A5)"

convert_fill "$BASE_PATH" "$IMG_DIR/DeepLearning101-cover-Letter.png" "$SIZE_Letter"
echo "Wrote $IMG_DIR/DeepLearning101-cover-Letter.png ($SIZE_Letter)"

convert_fill "$BASE_PATH" "$IMG_DIR/DeepLearning101-cover-A6.png" "$SIZE_A6"
echo "Wrote $IMG_DIR/DeepLearning101-cover-A6.png ($SIZE_A6)"

convert_fill "$BASE_PATH" "$IMG_DIR/DeepLearning101-cover-B5.png" "$SIZE_B5"
echo "Wrote $IMG_DIR/DeepLearning101-cover-B5.png ($SIZE_B5)"

convert_fill "$BASE_PATH" "$IMG_DIR/DeepLearning101-cover-Trade.png" "$SIZE_Trade"
echo "Wrote $IMG_DIR/DeepLearning101-cover-Trade.png ($SIZE_Trade)"

echo "All cover images updated."



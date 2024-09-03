#!/usr/bin/env bash
set -euxo pipefail
cd "$(dirname "$0")/.."

color="#0082c9"

rm -rf /tmp/nextcloud-neon
mkdir -p /tmp/nextcloud-neon

function copy_app_svg() {
  id="$1"
  path="$2"
  target="packages/neon_framework/packages/${id}_app/assets/app.svg"
  if [ -f "$path/img/app.svg" ]; then
    cp "$path/img/app.svg" "$target"
  elif [ -f "$path/img/$id.svg" ]; then
    cp "$path/img/$id.svg" "$target"
  else
    echo "Can not find icon for $id in $path"
    exit 1
  fi
  sed -i "s/fill=\"#[^\"]*\"/fill=\"white\"/g" "$target"
  sed -i "s/<svg /<svg style=\"background-color: $color\" /g" "$target"
}

function generate_android_icon_dpi() {
    source="$1"
    size="$2"
    name="$3"
    dpi="$4"
    inkscape "$source" -o "android/app/src/main/res/mipmap-${dpi}dpi/$name.png" -w "$size" -h "$size" --actions="export-background:$color"
    inkscape "$source" -o "android/app/src/main/res/drawable-${dpi}dpi/${name}_outline.png" -w "$size" -h "$size"
}

function generate_android_adaptive_icon() {
  icon="$1"
  echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>
<adaptive-icon xmlns:android=\"http://schemas.android.com/apk/res/android\">
    <background android:drawable=\"@drawable/background_gradient\"/>
    <foreground>
        <inset android:drawable=\"@drawable/${icon}_outline\" android:inset=\"25%\"/>
    </foreground>
    <monochrome>
        <inset android:drawable=\"@drawable/${icon}_outline\" android:inset=\"25%\"/>
    </monochrome>
</adaptive-icon>" > "android/app/src/main/res/mipmap-anydpi-v26/${icon}.xml"
}

function generate_android_icon() {
    source="$1"
    name="$2"
    generate_android_icon_dpi "$source" 72  "$name" h
    generate_android_icon_dpi "$source" 48  "$name" m
    generate_android_icon_dpi "$source" 96  "$name" xh
    generate_android_icon_dpi "$source" 144 "$name" xxh
    generate_android_icon_dpi "$source" 192 "$name" xxxh
    generate_android_adaptive_icon "$name"
}

function precompile_assets() {
  fvm dart run vector_graphics_compiler --input-dir assets/
  find assets/ -name "*.svg" -exec rm {} \;
}

wget https://raw.githubusercontent.com/Templarian/MaterialDesign/master/svg/cable-data.svg -O assets/logo.svg
cp assets/logo.svg assets/logo_inverted.svg
sed -i "s/<path /<path fill=\"white\" /g" assets/logo.svg
sed -i "s/<svg /<svg style=\"background-color: $color\" /g" assets/logo.svg
sed -i "s/<path /<path fill=\"$color\" /g" assets/logo_inverted.svg

wget https://raw.githubusercontent.com/nextcloud/promo/master/nextcloud-logo-inverted.svg -O packages/neon_framework/assets/logo_nextcloud.svg

icons_dir="packages/neon_framework/assets/icons/server/"
rm -rf "$icons_dir"
mkdir -p "$icons_dir"

shopt -s extglob
for file in external/nextcloud-server/{core/img/*,apps/*/img}/!(app|app-dark).svg; do
  name="$(basename "$file" | sed "s/.svg$//" | sed "s/-dark$//" | sed "s/-white$//").svg"
  if ! grep "<image " "$file"; then
    cp -u "$file" "$icons_dir/$name"
  fi
done

(
  cd packages/neon_framework
  precompile_assets
)

copy_app_svg dashboard external/nextcloud-server/apps/dashboard
copy_app_svg files external/nextcloud-server/apps/files
copy_app_svg news external/nextcloud-news
copy_app_svg notes external/nextcloud-notes
copy_app_svg notifications external/nextcloud-notifications
copy_app_svg talk external/nextcloud-spreed

(
  cd packages/neon_framework/example

  cp ../../../assets/logo.svg assets/logo.svg
  cp ../../../assets/logo_inverted.svg assets/logo_inverted.svg

  # Android icons
  generate_android_icon assets/logo.svg ic_launcher
  for path in ../packages/*_app; do
    icon="$(basename "$path")"
    generate_android_icon "$path/assets/app.svg" "$icon"
  done

  # Web icons
  inkscape assets/logo_inverted.svg -o web/icons/Icon-192.png -w 192 -h 192
  inkscape assets/logo_inverted.svg -o web/icons/Icon-512.png -w 512 -h 512
  inkscape assets/logo_inverted.svg -o web/favicon.png        -w 16  -h 16

  # Splash screens
  inkscape assets/logo_inverted.svg -o img/splash_icon.png            -w  768 -h  768                                      # 768px at xxxhdpi is 192dp
  inkscape assets/logo.svg          -o img/splash_icon_android_12.png -w 1152 -h 1152 --actions="export-background:$color" # 1152px at xxxhdpi is 288dp
  fvm dart run flutter_native_splash:create

  precompile_assets
  # Restore SVG logo
  cp ../../../assets/logo.svg assets/logo.svg
)

for path in packages/neon_framework/packages/*_app; do
  (
    cd "$path"
    precompile_assets
  )
done

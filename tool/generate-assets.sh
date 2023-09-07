#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

color="#f37736"

rm -rf /tmp/nextcloud-neon
mkdir -p /tmp/nextcloud-neon

function copy_app_svg() {
  id="$1"
  path="$2"
  target="packages/neon/neon_$id/assets/app.svg"
  if [ -f "$path/img/app.svg" ]; then
    cp "$path/img/app.svg" "$target"
  elif [ -f "$path/img/$id.svg" ]; then
    cp "$path/img/$id.svg" "$target"
  else
    echo "Can not find icon for $id in $path"
    exit 1
  fi
  sed -i "s/fill=\"#[^\"]*\"/fill=\"$color\"/g" "$target"
}

function export_mipmap_icon() {
    source="$1"
    name="$2"
    size="$3"
    dpi="$4"
    inkscape "$source" -o "android/app/src/main/res/mipmap-${dpi}dpi/$name.png" -w "$size" -h "$size"
}

function export_mipmap_icon_all() {
    source="$1"
    name="$2"
    export_mipmap_icon "$source" "$name" 72 h &
    export_mipmap_icon "$source" "$name" 48 m &
    export_mipmap_icon "$source" "$name" 96 xh &
    export_mipmap_icon "$source" "$name" 144 xxh &
    export_mipmap_icon "$source" "$name" 192 xxxh &
    wait
}

wget https://raw.githubusercontent.com/Templarian/MaterialDesign/master/svg/cable-data.svg -O assets/logo.svg
sed -i "s/<path /<path fill=\"$color\" /g" assets/logo.svg

wget https://raw.githubusercontent.com/nextcloud/promo/master/nextcloud-logo-inverted.svg -O packages/neon/neon/assets/logo_nextcloud.svg

icons_dir="packages/neon/neon/assets/icons/server/"
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
  cd packages/neon/neon
  fvm dart run vector_graphics_compiler --input-dir assets/icons/server
  rm -rf assets/icons/server/*.svg
)

copy_app_svg files external/nextcloud-server/apps/files
copy_app_svg news external/nextcloud-news
copy_app_svg notes external/nextcloud-notes
copy_app_svg notifications external/nextcloud-notifications

(
  cd packages/app

  # Splash screens
  inkscape assets/logo.svg -o img/splash_icon.png -w 768 -h 768 # 768px at xxxhdpi is 192dp
  convert -size 1152x1152 xc:none img/splash_icon.png -gravity center -composite img/splash_icon_android_12.png # 1152px at xxxhdpi is 288dp
  exiftool -overwrite_original -all= img/splash_icon_android_12.png # To remove timestamps

  # Android launcher icons
  export_mipmap_icon_all "assets/logo.svg" "ic_launcher" &
  for id in files news notes notifications; do
    export_mipmap_icon_all "../neon/neon_$id/assets/app.svg" "app_$id" &
  done
  wait

  fvm dart run flutter_native_splash:create
)

#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

color="#f37736"

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

function copy_nextcloud_app_svg() {
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

rm -rf /tmp/nextcloud-neon
mkdir -p /tmp/nextcloud-neon

copy_nextcloud_app_svg files external/nextcloud-server/apps/files
copy_nextcloud_app_svg news external/nextcloud-news
copy_nextcloud_app_svg notes external/nextcloud-notes
copy_nextcloud_app_svg notifications external/nextcloud-notifications

(
  cd packages/neon/neon

  # Nextcloud logo
  wget https://raw.githubusercontent.com/nextcloud/promo/master/nextcloud-logo-inverted.svg -O assets/logo_nextcloud.svg

  fvm dart run build_runner build --delete-conflicting-outputs
  fvm flutter gen-l10n
)

./tool/format.sh

#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

color="#f37736"

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

rm -rf /tmp/nextcloud-neon
mkdir -p /tmp/nextcloud-neon

copy_app_svg files external/nextcloud-server/apps/files
copy_app_svg news external/nextcloud-news
copy_app_svg notes external/nextcloud-notes
copy_app_svg notifications external/nextcloud-notifications

icons_dir="packages/neon/neon/assets/icons/server/"
rm -rf "$icons_dir"
mkdir -p "$icons_dir"

shopt -s extglob
for file in external/nextcloud-server/{core/img/*,apps/*/img}/!(app|app-dark).svg; do
  name="$(basename "$file" | sed "s/.svg$//" | sed "s/-dark$//" | sed "s/-white$//").svg"
  cp -u "$file" "$icons_dir/$name"
done

(
  cd packages/neon/neon

  fvm dart run vector_graphics_compiler --input-dir assets/icons/server
  rm -rf assets/icons/server/*.svg

  # Nextcloud logo
  wget https://raw.githubusercontent.com/nextcloud/promo/master/nextcloud-logo-inverted.svg -O assets/logo_nextcloud.svg

  melos run generate:neon:build_runner
  melos run generate:neon:l10n
)

melos run format

#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

color="#0082C9"

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

  melos run generate:neon:build_runner
  melos run generate:neon:l10n
)

melos run format

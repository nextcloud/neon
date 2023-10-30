#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

rm -rf /tmp/nextcloud-neon
mkdir -p /tmp/nextcloud-neon

function generate_spec() {
    path="$1"
    codename="$2"
    composer exec generate-spec -- "$path" "../../packages/nextcloud/lib/src/api/$codename.openapi.json" --first-content-type --openapi-version 3.1.0
}

for dir in external/nextcloud-server external/nextcloud-notifications external/nextcloud-spreed; do
  (
    cd "$dir"
    composer install
    composer install --no-dev
    git checkout . # Remove changed files
  )
done

for path in \
  core \
  apps/comments \
  apps/dashboard \
  apps/dav \
  apps/files \
  apps/files_external \
  apps/files_reminders \
  apps/files_sharing \
  apps/files_trashbin \
  apps/files_versions \
  apps/provisioning_api \
  apps/settings \
  apps/sharebymail \
  apps/theming \
  apps/updatenotification \
  apps/user_status \
  apps/weather_status \
; do
  (
    cd external/nextcloud-server
    generate_spec "$path" "$(basename $path)"
  )
done

(
  cd external/nextcloud-notifications
  generate_spec "." "notifications"
)
(
  cd external/nextcloud-spreed
  generate_spec "." "spreed"
)

for spec in packages/nextcloud/lib/src/api/*.openapi.json; do
  name="$(basename "$spec" | cut -d "." -f 1)"
  dir="packages/nextcloud/lib/src/patches/$name"
  if [ -d "$dir" ]; then
    for patch in "$dir/"*; do
      cp "$spec" "/tmp/nextcloud-neon/$name.json"
      jsonpatch --indent 4 "/tmp/nextcloud-neon/$name.json" "$patch" > "$spec"
    done
  fi
done

(
  cd external/nextcloud-server
  composer exec merge-specs -- --core ../../packages/nextcloud/lib/src/api/core.openapi.json --merged /tmp/nextcloud-neon/merged.json ../../packages/nextcloud/lib/src/api/*.openapi.json --openapi-version 3.1.0
)

jq \
  -s \
  '.[0] * {components: {schemas: .[1].components.schemas | with_entries(select(.key | endswith("Capabilities")))}, paths: {"/ocs/v2.php/cloud/capabilities": {get: {responses: .[1].paths."/ocs/v2.php/cloud/capabilities".get.responses}}}}' \
  packages/nextcloud/lib/src/api/core.openapi.json \
  /tmp/nextcloud-neon/merged.json \
  > /tmp/nextcloud-neon/core.json
cp /tmp/nextcloud-neon/core.json packages/nextcloud/lib/src/api/core.openapi.json

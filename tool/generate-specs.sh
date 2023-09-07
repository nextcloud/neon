#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

rm -rf /tmp/nextcloud-neon
mkdir -p /tmp/nextcloud-neon

(
  cd external/nextcloud-server
  composer update
  composer install --no-dev
  git checkout . # Remove changed files
)

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
  codename="$(echo $path | sed "s/^apps\///")"
  (
    cd external/nextcloud-server
    composer exec generate-spec -- "$path" "../../packages/nextcloud/lib/src/api/$codename.openapi.json" --first-content-type --openapi-version 3.1.0
  )
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

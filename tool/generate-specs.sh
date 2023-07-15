#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

rm -rf /tmp/nextcloud-neon
mkdir -p /tmp/nextcloud-neon

(
  cd external/nextcloud-openapi-extractor
  composer update && composer install
)

for path in core apps/provisioning_api apps/settings apps/theming apps/user_status; do
  codename="$(echo $path | sed "s/^apps\///")"
  ./external/nextcloud-openapi-extractor/generate-spec "external/nextcloud-server/$path" "packages/nextcloud/lib/src/api/$codename.openapi.json" --first-status-code --first-content-type --openapi-version 3.1.0
done

./external/nextcloud-openapi-extractor/merge-specs \
  --openapi-version 3.1.0 \
  --core packages/nextcloud/lib/src/api/core.openapi.json \
  --merged /tmp/nextcloud-neon/merged.json \
  packages/nextcloud/lib/src/api/*.openapi.json

jq \
  -s \
  '.[0] * {paths: {"/ocs/v2.php/cloud/capabilities": {get: {responses: .[1].paths."/ocs/v2.php/cloud/capabilities".get.responses}}}}' \
  packages/nextcloud/lib/src/api/core.openapi.json \
  /tmp/nextcloud-neon/merged.json \
  > /tmp/nextcloud-neon/core.json
cp /tmp/nextcloud-neon/core.json packages/nextcloud/lib/src/api/core.openapi.json

#!/usr/bin/env bash
set -euxo pipefail
cd "$(dirname "$0")/.."

rm -rf /tmp/nextcloud-neon
mkdir -p /tmp/nextcloud-neon

function generate_spec() {
    path="$1"
    codename="$2"
    ../nextcloud-openapi-extractor/generate-spec "$path" "/tmp/nextcloud-neon/$codename.openapi.json" --first-content-type --openapi-version 3.1.0

    # Use the full spec if it exists, otherwise use the default spec which is already the full spec.
    if [ -f "/tmp/nextcloud-neon/$codename.openapi-full.json" ]; then
      jq --indent 4 \
        ".info.title = \"$codename\"" \
        "/tmp/nextcloud-neon/$codename.openapi-full.json" \
        > "/tmp/nextcloud-neon/$codename.openapi.json"
    fi
}

(
  cd external/nextcloud-openapi-extractor
  composer install
)

(
  cd external/nextcloud-server

  for path in core apps/*; do
    if [ ! -f "$path/.noopenapi" ] &&
    [[ "$path" != "apps/cloud_federation_api" ]] &&
    [[ "$path" != "apps/federatedfilesharing" ]] &&
    [[ "$path" != "apps/federation" ]] &&
    [[ "$path" != "apps/oauth2" ]]; then
      generate_spec "$path" "$(basename "$path")"
    fi
  done
)

(
  cd external/nextcloud-notifications
  generate_spec "." "notifications"
)
(
  cd external/nextcloud-spreed
  generate_spec "." "spreed"
)
(
  cd external/nextcloud-drop_account
  generate_spec "." "drop_account"
)

for spec in /tmp/nextcloud-neon/*.openapi.json; do
  name="$(basename "$spec" | cut -d "." -f 1)"
  if [[ "$name" == "core" ]]; then
    continue;
  fi
  dir="packages/nextcloud/lib/src/patches/$name"
  if [ -d "$dir" ]; then
    for patch in "$dir/"*; do
      jsonpatch --indent 4 --in-place "$spec" "$patch"
    done
  fi
done

cp /tmp/nextcloud-neon/*.openapi.json packages/nextcloud/lib/src/api

./external/nextcloud-openapi-extractor/merge-specs \
  --core /tmp/nextcloud-neon/core.openapi.json \
  --merged /tmp/nextcloud-neon/merged.json \
  /tmp/nextcloud-neon/*.openapi.json \
  packages/nextcloud/lib/src/api/news.openapi.json \
  packages/nextcloud/lib/src/api/notes.openapi.json \
  packages/nextcloud/lib/src/api/uppush.openapi.json \
  --openapi-version 3.1.0

jq \
  --indent 4 \
  -s \
  '.[0] * {components: {schemas: .[1].components.schemas | with_entries(select(.key | endswith("Capabilities")))}, paths: {"/ocs/v2.php/cloud/capabilities": {get: {responses: .[1].paths."/ocs/v2.php/cloud/capabilities".get.responses}}}}' \
  /tmp/nextcloud-neon/core.openapi.json \
  /tmp/nextcloud-neon/merged.json \
  > packages/nextcloud/lib/src/api/core.openapi.json

for patch in "packages/nextcloud/lib/src/patches/core/"*; do
  jsonpatch --indent 4 --in-place packages/nextcloud/lib/src/api/core.openapi.json "$patch"
done

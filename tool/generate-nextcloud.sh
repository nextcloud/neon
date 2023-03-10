#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

rm -rf /tmp/nextcloud-neon
mkdir -p /tmp/nextcloud-neon

codenames=(core news notes notifications provisioning_api uppush user_status)
prefixes=(Core News Notes Notifications ProvisioningApi UnifiedPushProvider UserStatus)

base_spec=/tmp/nextcloud-neon/base.json
merged_spec=/tmp/nextcloud-neon/merged.json
for i in $(seq 0 $((${#codenames[@]} - 1))); do
  codename=${codenames[i]}
  prefix=${prefixes[i]}
  cp specs/"$codename".json /tmp/nextcloud-neon/"$codename".json
  jq \
    --arg prefix "$prefix" \
    -s \
    '.[]
    | .components.schemas = (.components.schemas | with_entries(.key = if .key == "OCSMeta" or .key == "EmptyOCS" then .key else $prefix + .key end))
    | walk(if type == "string" and . != "#/components/schemas/OCSMeta" and . != "#/components/schemas/EmptyOCS" then . |= sub("^#/components/schemas/";"#/components/schemas/" + $prefix) else . end)' \
    /tmp/nextcloud-neon/"$codename".json \
    > /tmp/nextcloud-neon/"$codename"-prefixed.json

  if [ ! -f $base_spec ]; then
    cp /tmp/nextcloud-neon/"$codename"-prefixed.json $base_spec
  else
      jq \
        -s \
        '{
          openapi: .[0].openapi,
          info: .[0].info,
          servers: .[0].servers,
          security: .[0].security,
          tags: (.[0].tags + .[1].tags),
          components: (.[0].components * .[1].components),
          paths: (.[0].paths * .[1].paths),
        }' \
        $base_spec \
        /tmp/nextcloud-neon/"$codename"-prefixed.json \
        > $merged_spec
      cp $merged_spec $base_spec
  fi
done

jq \
'
{
  openapi: .openapi,
  info: .info,
  servers: .servers,
  security: .security,
  tags: .tags,
  components: .components,
  paths: .paths,
}
| .info.title = "Nextcloud"
| .info.description = "All supported Nextcloud APIs in one"
' $merged_spec > packages/nextcloud/lib/src/nextcloud.openapi.json

(
  cd packages/nextcloud
  rm -rf .dart_tool/build
  fvm dart pub run build_runner build --delete-conflicting-outputs
)

./tool/format.sh

#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

rm -rf /tmp/nextcloud-neon
mkdir -p /tmp/nextcloud-neon

codenames=(core news notes notifications provisioning_api user_status)

base_spec=/tmp/nextcloud-neon/base.json
merged_spec=/tmp/nextcloud-neon/merged.json
for codename in ${codenames[*]}; do
  if [ ! -f $base_spec ]; then
    cp specs/"$codename".json $base_spec
  else
      jq \
        -s \
        '{
          servers: .[0].servers,
          security: .[0].security,
          tags: (.[0].tags + .[1].tags),
          components: (.[0].components * .[1].components),
          paths: (.[0].paths * .[1].paths),
        }' \
        $base_spec \
        specs/"$codename".json \
        > $merged_spec
      cp $merged_spec $base_spec
  fi
done

jq \
'
{
  openapi: "3.1.0",
  info: {
    title: "Nextcloud",
    version: "latest",
    license: {
      name: "agpl",
      identifier: "AGPL-3.0"
    }
  },
  servers: .servers,
  security: .security,
  tags: .tags,
  components: .components,
  paths: .paths,
}
' $merged_spec > packages/nextcloud/lib/src/nextcloud.openapi.json

(
  cd packages/nextcloud
  rm -rf .dart_tool/build
  fvm dart pub run build_runner build --delete-conflicting-outputs
)

./tool/format.sh

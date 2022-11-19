#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

rm -rf /tmp/nextcloud-neon
mkdir -p /tmp/nextcloud-neon

xmlstarlet \
  edit \
  --update "/info/version" \
  --value "$(cd external/nextcloud-server && git describe --tags | sed "s/^v//")" \
  specs/templates/appinfo_core.xml \
  > /tmp/nextcloud-neon/appinfo_core1.xml
xmlstarlet \
  format \
  --indent-spaces 4 \
  /tmp/nextcloud-neon/appinfo_core1.xml \
  > /tmp/nextcloud-neon/appinfo_core2.xml
cp /tmp/nextcloud-neon/appinfo_core2.xml specs/templates/appinfo_core.xml

function generate_spec_templates() {
  fvm dart packages/spec_templates/bin/generate.dart "$1" "$2"
}

generate_spec_templates external/nextcloud-news false
generate_spec_templates external/nextcloud-notes false
generate_spec_templates external/nextcloud-notifications false
generate_spec_templates external/nextcloud-server/apps/provisioning_api false
generate_spec_templates external/nextcloud-server/apps/user_status false
generate_spec_templates external/nextcloud-server/core true

codenames=(core news notes notifications provisioning_api user_status)

for codename in ${codenames[*]}; do
  jq \
      --arg codename "$codename" \
      -s \
      '{
        openapi: .[0].openapi,
        info: .[0].info,
        servers: [
          {
            url: "https://{hostname}:{port}",
            variables: {
              hostname: {
                default: "localhost"
              },
              port: {
                default: "8080"
              }
            }
          }
        ],
        security: [
          {
            basic_auth: []
          }
        ],
        tags: .[1].tags,
        components: {
          schemas: .[1].components.schemas
        },
        paths: .[1].paths
      } |
      .components.securitySchemes = {
        basic_auth: {
          type: "http",
          scheme: "basic",
        },
      } |
      .components.schemas.OCSMeta =
      {
        type: "object",
        required: [
          "status",
          "statuscode"
        ],
        properties: {
          status: {
            type: "string"
          },
          statuscode: {
            type: "integer"
          },
          message: {
            type: "string"
          },
          totalitems: {
            type: "string"
          },
          itemsperpage: {
            type: "string"
          }
        }
      } |
      .components.schemas.EmptyOCS =
      {
        type: "object",
        required: [
          "ocs"
        ],
        properties: {
          ocs: {
            type: "object",
            required: [
              "meta",
              "data"
            ],
            properties: {
              meta: {
                "$ref": "#/components/schemas/OCSMeta"
              },
              data: {
                type: "array"
              }
            }
          }
        }
      }
      ' \
      specs/templates/"$codename".json \
      specs/"$codename".json \
      > /tmp/nextcloud-neon/"$codename".json
    cp /tmp/nextcloud-neon/"$codename".json specs/"$codename".json
done

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

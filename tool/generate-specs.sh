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

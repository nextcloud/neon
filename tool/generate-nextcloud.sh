#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

openapi_generate() {
  codename="$1"
  is_common="$2" # Rewrites the package to use the common package
  tmpdir="/tmp/nextcloud-neon/$codename"
  spec="specs/$codename.json"

  rm -rf "$tmpdir"

  java -jar external/openapi-generator/modules/openapi-generator-cli/target/openapi-generator-cli.jar generate \
  --input-spec "$spec" \
  --output "$tmpdir" \
  --generator-name dart

  (
    cd "$tmpdir"
    if [[ "$is_common" == "true" ]]; then
      (
        cd lib
        echo '// @dart=2.12

part of openapi.api;

abstract class BaseApiClient {
    Future<String> serializeAsync(Object? value);

    Future<dynamic> deserializeAsync(String json, String targetType, {bool growable = false,});

    void addDefaultHeader(String key, String value);
}
' > api_client.dart
        sed -i -z "s/ApiClient.*//g" api.dart
        echo '

abstract class ApiInstance<T extends BaseApiClient> {
  ApiInstance(this.apiClient);

  final T apiClient;
}
' >> api.dart
      )
    else
      (
        cd lib
        rm -rf auth/ api_{exception,helper}.dart
        sed -i -z "s/part 'auth\/[^;]*;\n//g" api.dart
        sed -i -z "s/part 'api_helper.dart';\n//g" api.dart
        sed -i -z "s/part 'api_exception.dart';\n//g" api.dart
        sed -i -z "s/library openapi.api;/library openapi.api;\n\nimport 'package:nextcloud\/src\/clients\/common\/api.dart';/" api.dart
        sed -i -z "s/const _.*//g" api.dart
        sed -i -z "s/class ApiClient {/class ApiClient extends BaseApiClient {/" api_client.dart
        # shellcheck disable=SC2044
        for file in $(find ./api/ -name "*.dart"); do
          sed -i "s/Api {/Api extends ApiInstance<ApiClient> {/g" "$file"
          sed -i "s/(\[ApiClient? apiClient\]) : apiClient = apiClient ?? defaultApiClient;/(ApiClient apiClient) : super(apiClient);/g" "$file"
          sed -i -z "s/  final ApiClient apiClient;\n\n//g" "$file"
        done
      )
    fi

    # shellcheck disable=SC2044
    for file in $(find . -name "*.dart"); do
      sed -i "s/_decodeBodyBytes/decodeBodyBytes/g" "$file"
      sed -i "s/_queryParams/buildQueryParams/g" "$file"
      sed -i "s/_delimiters/apiDelimiters/g" "$file"
      sed -i "s/_dateEpochMarker/apiDateEpochMarker/g" "$file"
      sed -i "s/_dateFormatter/apiDateFormatter/g" "$file"
      sed -i "s/_regList/apiRegList/g" "$file"
      sed -i "s/_regSet/apiRegSet/g" "$file"
      sed -i "s/_regMap/apiRegMap/g" "$file"
    done
  )

  outdir=""
  if [[ "$is_common" == "true" ]]; then
    outdir="packages/nextcloud/lib/src/clients/$codename"
  else
    outdir="packages/nextcloud/lib/src/clients/generated/$codename"
  fi

  rm -rf "$outdir"
  cp -r "$tmpdir/lib" "$outdir"

  rm -rf "packages/nextcloud/doc/$codename"
  cp -r "$tmpdir/doc" "packages/nextcloud/doc/$codename"
}

function spec_templates_generate() {
  appdir="$1"
  is_core="$2"
  fvm dart packages/spec_templates/bin/generate.dart "$appdir" "$is_core"
}

(
  cd external/openapi-generator
  ./mvnw package -DskipTests -Dmaven.test.skip=true
)

rm -rf /tmp/nextcloud-neon
mkdir -p /tmp/nextcloud-neon

spec_templates_generate external/nextcloud-news false
spec_templates_generate external/nextcloud-notes false
spec_templates_generate external/nextcloud-notifications false
spec_templates_generate external/nextcloud-server/apps/provisioning_api false
spec_templates_generate external/nextcloud-server/apps/user_status false
spec_templates_generate external/nextcloud-server/core true

openapi_generate "common" true
openapi_generate "core" false
openapi_generate "news" false
openapi_generate "notes" false
openapi_generate "notifications" false
openapi_generate "provisioning_api" false
openapi_generate "user_status" false

./tool/format.sh

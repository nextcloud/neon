#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

(
  cd packages/dynamite/dynamite_end_to_end_test
  wget https://petstore3.swagger.io/api/v3/openapi.json -O lib/src/petstore.openapi.json
  rm -rf .dart_tool/build
  fvm dart pub run build_runner build --delete-conflicting-outputs
  # For some reason we need to fix and format twice, otherwise not everything gets fixed
  fvm dart fix --apply lib/src/
  melos run format
  fvm dart fix --apply lib/src/
  melos run format
)

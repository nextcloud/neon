#!/usr/bin/env bash
set -euxo pipefail
cd "$(dirname "$0")/.."

(
  cd packages/nextcloud
  rm -rf .dart_tool/build/generated/dynamite
  fvm dart run generate_props.dart
  fvm dart run build_runner build --delete-conflicting-outputs
  fvm dart run generate_exports.dart
  fvm dart fix --apply lib/src/api/
  melos run format
)

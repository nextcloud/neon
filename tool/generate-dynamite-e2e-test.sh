#!/usr/bin/env bash
set -euxo pipefail
cd "$(dirname "$0")/.."

(
  cd packages/dynamite/packages/dynamite_end_to_end_test
  rm -rf .dart_tool/build/generated/dynamite
  fvm dart run build_runner build --delete-conflicting-outputs
  fvm dart fix --apply lib/
  melos run format
  fvm dart fix --apply lib/
  melos run format
)

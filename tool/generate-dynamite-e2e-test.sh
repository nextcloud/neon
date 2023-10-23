#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

(
  cd packages/dynamite/dynamite_end_to_end_test
  rm -rf .dart_tool/build/generated/dynamite
  bash generate.sh
)

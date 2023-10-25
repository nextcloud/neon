#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

(
  cd packages/nextcloud
  rm -rf .dart_tool/build/generated/dynamite
  bash generate.sh
)

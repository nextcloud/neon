#!/bin/bash
set -euxo pipefail

function cleanup() {
  chown -R "$ORIGINAL_USER:$ORIGINAL_GROUP" .
}
trap cleanup EXIT

cd /src/packages/neon

rm -rf .packages .dart_tool
flutter build linux

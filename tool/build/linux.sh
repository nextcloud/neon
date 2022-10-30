#!/bin/bash
set -euxo pipefail

if [ ! -f /.dockerenv ]; then
  echo "This script needs to run in a specific docker container, use the build-neon.sh script"
  exit 1
fi

function cleanup() {
  chown -R "$ORIGINAL_USER:$ORIGINAL_GROUP" .
}
trap cleanup EXIT

cd /src/packages/neon
# shellcheck disable=SC2086
flutter build linux ${BUILD_ARGS[*]}
#!/usr/bin/env bash
set -euxo pipefail

if [ ! -f /.dockerenv ]; then
  echo "This script needs to run in a specific docker container, use the build-app.sh script"
  exit 1
fi

function cleanup() {
  chown -R "$ORIGINAL_USER:$ORIGINAL_GROUP" .
}
trap cleanup EXIT

cd /src/packages/app
# shellcheck disable=SC2086
flutter build linux ${BUILD_ARGS[*]}

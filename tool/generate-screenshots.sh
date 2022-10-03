#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

./tool/build-dev-container-image.sh
container_id="$(docker run --rm -d -p "80:80" nextcloud-neon-dev)"
function cleanup() {
    docker kill "$container_id"
}
trap cleanup EXIT

(
  cd packages/neon
  fvm flutter drive \
    --driver=test_driver/integration_test.dart \
    --target=integration_test/screenshot_test.dart \
    --android-emulator
)

#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

ip=""
if [ "$#" -ne 1 ]; then
  echo "You need to give the platform type: localhost, android-emulator"
  exit 1
elif [[ "$1" == "android-emulator" ]]; then
  ip="10.0.2.2"
elif [[ "$1" == "localhost" ]]; then
  ip="localhost"
else
  echo "Unknown platform type: $1"
  exit 1
fi

./tool/build-dev-container-image.sh

echo "TEST_HOST=$ip
TEST_USER=user1
TEST_PASSWORD=user1" > packages/neon/assets/.env
(
  cd packages/nextcloud_push_proxy
  fvm dart run bin/unified_push.dart ./tmp/devices.json
) &

function cleanup() {
  rm packages/neon/assets/.env
}
trap cleanup EXIT
docker run --rm -v nextcloud-neon-dev:/usr/src/nextcloud -p "80:80" --add-host host.docker.internal:host-gateway nextcloud-neon-dev

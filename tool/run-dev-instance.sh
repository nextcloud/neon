#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

username="test"
password="supersafepasswordtocircumventpasswordpolicies"
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

docker build -t nextcloud-neon-dev --build-arg "username=$username" --build-arg "password=$password" -f - ./packages/nextcloud/test < tool/Dockerfile.dev
echo "TEST_HOST=$ip
TEST_USER=$username
TEST_PASSWORD=$password" > packages/neon/assets/.env
(
  cd packages/nextcloud_push_proxy
  fvm dart run bin/unified_push.dart ./tmp/devices.json
) &

function cleanup() {
  rm packages/neon/assets/.env
}
trap cleanup EXIT
# The multiple ports are used to let the app think we are talking to two different servers when in fact it's only one
docker run --rm -v nextcloud-neon-dev:/usr/src/nextcloud -p "80:80" -p "81:80" --add-host host.docker.internal:host-gateway nextcloud-neon-dev

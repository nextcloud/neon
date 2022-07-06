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

docker build -t nextcloud-harbour-dev --build-arg "username=$username" --build-arg "password=$password" -f - ./packages/nextcloud/test < tool/Dockerfile.dev
echo "TEST_HOST=http://$ip:80
TEST_USER=$username
TEST_PASSWORD=$password" > packages/harbour/assets/.env
function cleanup() {
  rm packages/harbour/assets/.env
}
trap cleanup EXIT
# The multiple ports are used to let the app think we are talking to two different servers when in fact it's only one
docker run --rm -v nextcloud-harbour-dev:/usr/src/nextcloud -p "80:80" -p "81:80" nextcloud-harbour-dev

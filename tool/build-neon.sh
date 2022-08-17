#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

arches=("amd64" "arm64")
flutter_version="$(jq ".flutterSdkVersion" -r < .fvm/fvm_config.json | cut -d "@" -f 1)"

function cleanup() {
  cd packages/neon
  rm -rf .packages .dart_tool
  fvm flutter pub get
}
trap cleanup EXIT

for arch in "${arches[@]}"; do
  docker buildx build \
  --platform "linux/$arch" \
  --progress plain \
  -t "nextcloud-neon-build:$arch"  \
  --build-arg="FLUTTER_VERSION=$flutter_version" \
  -f tool/Dockerfile.build \
  ./tool

  docker run \
  --platform "linux/$arch" \
  --rm -it \
  -e "ORIGINAL_USER=$(id -u)" \
  -e "ORIGINAL_GROUP=$(id -g)" \
  -v "$(pwd):/src" \
  "nextcloud-neon-build:$arch"
done

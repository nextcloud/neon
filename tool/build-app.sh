#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."
source tool/common.sh

targets=("linux/arm64" "linux/amd64")

target="$1"

# shellcheck disable=SC2076
if ! [[ ${targets[*]} =~ "$target" ]]; then
  echo "Unknown target $target, must be one of ${targets[*]}"
  exit 1
fi

if [ ! -v FLUTTER_VERSION ]; then
  # shellcheck disable=SC2155
  export FLUTTER_VERSION="$(jq ".flutterSdkVersion" -r < .fvm/fvm_config.json | cut -d "@" -f 1)"
fi

if [[ "$target" == "linux/arm64" ]] || [[ "$target" == "linux/amd64" ]]; then
  os="$(echo "$target" | cut -d "/" -f 1)"
  arch="$(echo "$target" | cut -d "/" -f 2)"

  tag="$(image_tag "build:$os-$arch")"

  # shellcheck disable=SC2046
  docker buildx build \
  --platform "$target" \
  --progress plain \
  --tag "$tag"  \
  --build-arg="FLUTTER_VERSION=$FLUTTER_VERSION" \
  $(cache_build_args "$tag") \
  -f "tool/build/Dockerfile.$os" \
  ./tool/build

  run_args=()
  for path in packages/{app,dynamite/dynamite_runtime,file_icons,neon_lints,nextcloud,sort_box}/{lib,pubspec.yaml} packages/neon/*/{assets,lib,pubspec.yaml,pubspec_overrides.yaml} packages/file_icons/fonts packages/nextcloud/pubspec_overrides.yaml packages/app/{pubspec_overrides.yaml,assets,build,linux}; do
    run_args+=(-v "$(pwd)/$path:/src/$path")
  done
  mkdir -p "packages/app/build"

  container_id="$(
    # shellcheck disable=SC2086
    docker run \
    --platform "$target" \
    --rm -d \
    -e "ORIGINAL_USER=$(id -u)" \
    -e "ORIGINAL_GROUP=$(id -g)" \
    -e "BUILD_ARGS=${*:2}" \
    ${run_args[*]} \
    "$tag"
  )"

  function cleanup() {
    docker kill "$container_id" > /dev/null 2>&1 || true
  }
  trap cleanup EXIT

  docker logs -f "$container_id"
fi

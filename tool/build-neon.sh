#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

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

  build_args=()
  if [ -v GITHUB_REPOSITORY ]; then
    image="ghcr.io/$GITHUB_REPOSITORY/build-$os-$arch"
    build_args+=(
      "--push"
      "--cache-from" "type=registry,ref=$image"
      "--cache-to" "type=registry,ref=$image,mode=max"
    )
    tag="$image:$FLUTTER_VERSION"
  else
    tag="nextcloud-neon-build-$os-$arch:$FLUTTER_VERSION"
  fi

  # shellcheck disable=SC2086
  docker buildx build \
  --platform "$target" \
  --progress plain \
  --tag "$tag"  \
  --build-arg="FLUTTER_VERSION=$FLUTTER_VERSION" \
  ${build_args[*]} \
  -f "tool/build/Dockerfile.$os" \
  ./tool/build

  paths=()
  for path in packages/*; do
    paths+=("$path/lib" "$path/pubspec.yaml")
  done
  run_args=()
  for path in ${paths[*]} "packages/file_icons/fonts" "packages/neon/assets" "packages/neon/build" "packages/neon/linux"; do
    run_args+=(-v "$(pwd)/$path:/src/$path")
  done
  mkdir -p "packages/neon/build"

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
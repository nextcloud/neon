#!/usr/bin/env bash
set -euxo pipefail

function image_tag() {
  name="$1"
  echo "ghcr.io/${GITHUB_REPOSITORY:-nextcloud/neon}/$name"
}

function cache_build_args() {
    tag="$(echo "$1" | cut -d ":" -f 1)"

    build_args=(
      "--load"
      "--cache-from" "$tag"
    )
    if [ -v PUSH_IMAGES ]; then
      build_args+=("--cache-to" "$tag")
    fi

    echo "${build_args[*]}"
}

function preset_image_tag() {
  path="$(realpath --relative-to ./packages/nextcloud/packages/nextcloud_test_presets/docker/presets "$1")"
  name="$(dirname "$path")"
  version="$(basename "$path")"
  image_tag "dev:$name-$version"
}

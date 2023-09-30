#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."
source tool/common.sh

tag="$(image_tag "dev:latest")"

# shellcheck disable=SC2046
docker buildx build --tag "$tag" $(cache_build_args "$tag") -f - ./tool < tool/Dockerfile.dev

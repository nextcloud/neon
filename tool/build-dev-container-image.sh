#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

docker build -t nextcloud-neon-dev --build-arg "username=$username" --build-arg "password=$password" -f - ./packages/nextcloud/test < tool/Dockerfile.dev

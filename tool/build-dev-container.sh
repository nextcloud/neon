#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

docker build -t nextcloud-neon-dev -f - ./tool < tool/Dockerfile.dev

#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

./tool/build-dev-container.sh

echo "Running development instance on http://localhost. To access it in an Android Emulator use http://10.0.2.2"
docker run --rm -v nextcloud-neon-dev:/usr/src/nextcloud -v nextcloud-neon-dev:/var/www/html -p "80:80" --net="host" nextcloud-neon-dev

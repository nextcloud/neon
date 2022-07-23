#!/bin/bash
set -euxo pipefail

docker exec -it "$(docker ps | grep nextcloud-neon-dev | cut -d " " -f 1)" /bin/bash -c "php -f occ notification:test-push test $*"

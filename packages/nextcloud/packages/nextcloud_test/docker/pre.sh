#!/bin/sh
set -eux

./occ maintenance:install --admin-pass admin --admin-email admin@example.com
./occ config:system:set allow_local_remote_servers --value=true
./occ config:system:set trusted_domains 1 --value="*"
./occ config:system:set debug --value=true --type=boolean
./occ config:system:set loglevel --value=0 --type=integer

./occ app:disable password_policy
OC_PASS="user1" ./occ user:add --password-from-env --display-name "User One" user1
OC_PASS="user2" ./occ user:add --password-from-env --display-name "User Two" user2
./occ app:enable password_policy

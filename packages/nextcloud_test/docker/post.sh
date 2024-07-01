#!/bin/sh
set -eux

./occ app:enable cookbook "$@"
./occ app:enable news "$@"
./occ app:enable notes "$@"
./occ app:enable uppush "$@"
./occ app:enable spreed "$@"
./occ talk:turn:add turn,turns staticauth.openrelay.metered.ca:443 udp,tcp --secret openrelayprojectsecret
./occ app:enable tables "$@"
./occ app:enable drop_account "$@"

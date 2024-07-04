#!/bin/sh
set -eux

rm -rf data config/config.php static

"$(dirname "$0")/pre.sh"

PHP_CLI_SERVER_WORKERS=10 php -S 0.0.0.0:8080 &
pid="$!"
cleanup() {
    kill "$pid"
}
trap cleanup EXIT

until curl -s -o /dev/null http://localhost:8080/status.php; do true; done

cp -r "$(dirname "$0")/static" .
for user in admin user1 user2; do
  curl -u "$user:$user" -H "ocs-apirequest: true" -s -o /dev/null http://localhost:8080/ocs/v2.php/cloud/user
  cp -r "$(dirname "$0")/assets/Recipes" "data/$user/files"
done
./occ files:scan --all

"$(dirname "$0")/post.sh" --force

echo "Ready!"
sleep infinity

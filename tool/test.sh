#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

rm -rf /tmp/nextcloud-harbour
mkdir -p /tmp/nextcloud-harbour

(
  cd packages/nextcloud
  fvm dart test "$@"

  # The coverage used to work, but due to some change it's broken right now
  #rm coverage -rf
  #fvm dart run coverage:test_with_coverage --function-coverage --branch-coverage "$@"
  #lcov --remove coverage/lcov.info "$(pwd)/lib/src/clients/**/model/*" "$(pwd)/lib/src/clients/**/auth/*" "$(pwd)/lib/src/clients/common/*" "$(pwd)/lib/src/clients/**/api_client.dart" -o coverage/filtered.info
  #genhtml coverage/filtered.info -o coverage/html
)

#!/usr/bin/env bash
set -euxo pipefail
cd "$(dirname "$0")/.."

(
  cd packages/nextcloud_test
  fvm dart run nextcloud_test:generate_presets
)

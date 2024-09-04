#!/usr/bin/env bash
set -euxo pipefail
cd "$(dirname "$0")/.."

(
  cd packages/nextcloud/packages/nextcloud_test_presets
  fvm dart run nextcloud_test_presets:generate_presets
)

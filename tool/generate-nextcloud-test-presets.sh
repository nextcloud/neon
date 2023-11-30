#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

(
  cd packages/nextcloud_test
  fvm dart run nextcloud_test:generate_presets

  # Remove notes 4.6.0 release because it has an invalid PHP requirement which makes the app fail to install.
  rm docker/presets/notes/4.6.0
)

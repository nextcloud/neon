#!/usr/bin/env bash
set -euxo pipefail
cd "$(dirname "$0")/.."

(
  cd packages/nextcloud_test
  fvm dart run nextcloud_test:generate_presets

  # Remove notes releases because they have an invalid PHP requirement which makes the app fail to install.
  rm docker/presets/notes/4.6

  # 2.2 does not expose the capability and 2.3 is also compatible with 26 so it can be easily upgraded.
  rm docker/presets/drop_account/2.2
)

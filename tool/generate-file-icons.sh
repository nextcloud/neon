#!/usr/bin/env bash
set -euxo pipefail
cd "$(dirname "$0")/.."

(
  cd packages/neon_framework/packages/files_icons
  fvm dart run
)
